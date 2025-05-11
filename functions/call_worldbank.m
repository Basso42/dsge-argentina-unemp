function [output_mat, output_table, dates_nb] = call_worldbank(varargin)
    % call_worldbank: Query World Bank data using indicator/country/date syntax
    % Example usage:
    % [mat, table, dates] = call_worldbank('NY.GDP.MKTP.CD/US/2000:2020');

    slugs = varargin;
    output = [];

    for i = 1:length(slugs)
        % Parse slug: indicator/country/daterange
        parts = strsplit(slugs{i}, '/');
        if numel(parts) < 3
            error('Slug must be in format "indicator/country/daterange", e.g., "NY.GDP.MKTP.CD/FR/2000:2020"');
        end
        indicator = parts{1};
        country = parts{2};
        date_range = parts{3};

        % Construct API URL
        url = sprintf(['http://api.worldbank.org/v2/country/%s/indicator/%s?date=%s&format=json&per_page=1000'], ...
                      country, indicator, date_range);

        % Fetch data
        try
            opts = weboptions('Timeout', 30);
            raw = webread(url, opts);
            if numel(raw) < 2
                error('No data returned. Check slug: %s', slugs{i});
            end
            records = raw{2};
        catch
            error('World Bank query failed for slug: %s', slugs{i});
        end

        % Extract and clean data (assume struct array)
        years = [];
        values = [];
        for j = 1:length(records)
            if ~isempty(records(j).value)
                year_val = str2double(records(j).date);
                data_val = records(j).value;
                if isnumeric(data_val)
                    years(end+1, 1) = year_val; %#ok<AGROW>
                    values(end+1, 1) = data_val; %#ok<AGROW>
                end
            end
        end

        % Sort data
        [years, idx] = sort(years);
        values = values(idx);

        % Align with existing output
        if i == 1
            output = [years, values];
        else
            all_years = union(output(:,1), years);
            new_output = nan(length(all_years), size(output,2)+1);
            [~, ia] = ismember(output(:,1), all_years);
            new_output(ia,1:size(output,2)) = output;

            [~, ib] = ismember(years, all_years);
            new_output(ib,end) = values;

            output = new_output;
            output(:,1) = all_years;
        end
    end

    % Output matrix
    output_mat = output;

    % Output table
    date_labels = cellstr(num2str(output(:,1)));
    varnames = cell(1, length(slugs));
    for i = 1:length(slugs)
        parts = strsplit(slugs{i}, '/');
        varname = [parts{1} '_' parts{2}];
        varname = regexprep(varname, '[-.]', '_');
        if ~isempty(varname) && ~isnan(str2double(varname(1)))
            varname = ['var_' varname];
        end
        varnames{i} = varname;
    end
    output_table = array2table(output(:,2:end), ...
                               'VariableNames', varnames, ...
                               'RowNames', date_labels);

    % Numeric date representation (as year)
    dates_nb = output(:,1);
end
