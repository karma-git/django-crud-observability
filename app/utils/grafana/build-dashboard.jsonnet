// dashboard info variables
local dashboard_title = 'django-crud-observability';
local dashboard_description = 'vizualization for django-crud-app metrics';
// panels
local panels = import 'panels.libsonnet';

{
  annotations: {
    list: [
      {
        builtIn: 1,
        datasource: '-- Grafana --',
        enable: true,
        hide: true,
        iconColor: 'rgba(0, 211, 255, 1)',
        name: 'Annotations & Alerts',
        type: 'dashboard',
      },
    ],
  },
  description: dashboard_description,
  editable: true,
  gnetId: null,
  graphTooltip: 0,
  id: null,
  links: [],
  panels: panels,
  refresh: false,
  schemaVersion: 26,
  style: 'dark',
  tags: [],
  templating: {
    list: [],
  },
  time: {
    from: 'now-1h',
    to: 'now',
  },
  timepicker: {},
  timezone: '',
  title: dashboard_title,
  uid: 'random',
  version: 1,
}
