# Publically exposed Nylas UI Components
class NylasComponentKit
  @load = (prop, path) ->
    Object.defineProperty @prototype, prop,
      get: -> require "../components/#{path}"

  @loadFrom = (prop, path) ->
    Object.defineProperty @prototype, prop,
      get: ->
        exported = require "../components/#{path}"
        return exported[prop]

  @loadDeprecated = (prop, path, {instead} = {}) ->
    {deprecate} = require '../deprecate-utils'
    Object.defineProperty @prototype, prop,
      get: deprecate prop, instead, @, ->
        exported = require "../components/#{path}"
        return exported
      enumerable: true

  @load "Menu", 'menu'
  @load "Calendar", 'calendar'
  @load "DropZone", 'drop-zone'
  @load "Spinner", 'spinner'
  @load "Switch", 'switch'
  @loadDeprecated "Popover", 'popover', instead: 'Actions.openPopover'
  @load "FixedPopover", 'fixed-popover'
  @load "Modal", 'modal'
  @load "Flexbox", 'flexbox'
  @load "RetinaImg", 'retina-img'
  @load "SwipeContainer", 'swipe-container'
  @load "FluxContainer", 'flux-container'
  @load "ListTabular", 'list-tabular'
  @load "DraggableImg", 'draggable-img'
  @load "EventedIFrame", 'evented-iframe'
  @load "ButtonDropdown", 'button-dropdown'
  @load "Contenteditable", 'contenteditable/contenteditable'
  @load "MultiselectList", 'multiselect-list'
  @load "KeyCommandsRegion", 'key-commands-region'
  @load "InjectedComponent", 'injected-component'
  @load "TokenizingTextField", 'tokenizing-text-field'
  @load "MultiselectActionBar", 'multiselect-action-bar'
  @load "InjectedComponentSet", 'injected-component-set'
  @load "TimeoutTransitionGroup", 'timeout-transition-group'
  @load "MetadataComposerToggleButton", 'metadata-composer-toggle-button'
  @load "ConfigPropContainer", "config-prop-container"
  @load "DisclosureTriangle", "disclosure-triangle"
  @load "EditableList", "editable-list"
  @load "OutlineViewItem", "outline-view-item"
  @load "OutlineView", "outline-view"
  @load "DateInput", "date-input"

  @load "ScrollRegion", 'scroll-region'
  @load "ResizableRegion", 'resizable-region'

  @loadFrom "MailLabel", "mail-label"
  @loadFrom "LabelColorizer", "mail-label"
  @load "MailLabelSet", "mail-label-set"
  @load "MailImportantIcon", 'mail-important-icon'

  @loadFrom "FormItem", "generated-form"
  @loadFrom "GeneratedForm", "generated-form"
  @loadFrom "GeneratedFieldset", "generated-form"

  @load "ScenarioEditor", 'scenario-editor'
  @load "NewsletterSignup", 'newsletter-signup'

module.exports = new NylasComponentKit()
