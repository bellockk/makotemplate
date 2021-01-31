<%! import yaml %><%
  with open(FILE, 'r') as file_object:
    data = yaml.safe_load(file_object)
%>\
% for value in data:
${value} \
% endfor

