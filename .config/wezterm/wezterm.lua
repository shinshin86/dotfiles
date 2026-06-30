-- Reference: https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization (Author: mozumasu)

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブが一つの時は非表示
config.hide_tab_bar_if_only_one_tab = true
-- falseにするとタブバーの透過が効かなくなる
-- config.use_fancy_tab_bar = false

-- タブバーの透過
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
  colors = { "#000000" },
}

-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
config.show_close_tab_button_in_tabs = false

-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

----------------------------------------------------
-- keybinds
----------------------------------------------------
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

----------------------------------------------------
-- 現在開いているWezTermすべてのタブをクリップボードにコピー
----------------------------------------------------
local wezterm = require 'wezterm'

config.keys = config.keys or {}

table.insert(config.keys, {
  key = 'P',
  mods = 'CTRL|SHIFT|ALT',

  -- Ctrl + Shift + Alt + P を押すと、
  -- 現在開いているすべてのWezTerm GUIウィンドウ内の
  -- すべてのタブ、すべてのペインのカレントディレクトリを集める。
  --
  -- 結果はフルパスだけを1行ずつ並べたテキストとして
  -- クリップボードにコピーされる。
  --
  -- 例:
  -- /Users/me/project-a
  -- /Users/me/project-b
  -- /home/me/app
  action = wezterm.action_callback(function(source_window, _)
    local lines = {}
    local count = 0
    local unknown_count = 0

    -- 開いているすべてのWezTerm GUIウィンドウを対象にする
    for _, gui_window in ipairs(wezterm.gui.gui_windows()) do
      local mux_window = gui_window:mux_window()

      -- 各ウィンドウ内のすべてのタブを対象にする
      for _, tab_info in ipairs(mux_window:tabs_with_info()) do
        -- 各タブ内のすべてのペインを対象にする
        for _, pane_info in ipairs(tab_info.tab:panes_with_info()) do
          local pane = pane_info.pane

          -- 新しいWezTermでは Url オブジェクトが返る。
          -- cwd.file_path にデコード済みのフルパスが入っている。
          local cwd = pane:get_current_working_dir()

          count = count + 1

          if cwd and cwd.file_path and cwd.file_path ~= '' then
            lines[#lines + 1] = cwd.file_path
          else
            -- WezTermがそのペインの場所を把握できない場合
            lines[#lines + 1] = '<unknown>'
            unknown_count = unknown_count + 1
          end
        end
      end
    end

    -- フルパスを1行ずつ並べてクリップボードにコピーする
    source_window:copy_to_clipboard(table.concat(lines, '\n'), 'Clipboard')

    -- コピー完了を通知する
    source_window:toast_notification(
      'WezTerm',
      string.format('%d個の場所をコピーしました。unknown=%d', count, unknown_count),
      nil,
      2500
    )
  end),
})

return config
