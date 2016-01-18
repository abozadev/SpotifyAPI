public partial class Header: Fuse.Controls.Text
{
    static Header()
    {
    }
    public Header()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        this.TextWrapping = Fuse.Elements.TextWrapping.Wrap;
        this.FontSize = 22f;
        this.Margin = float4(10f, 10f, 10f, 5f);
    }
}
public partial class Article: Fuse.Controls.Text
{
    static Article()
    {
    }
    public Article()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        this.TextWrapping = Fuse.Elements.TextWrapping.Wrap;
        this.FontSize = 13f;
        this.Margin = float4(10f, 0f, 10f, 0f);
    }
}
public partial class PublishedDate: Fuse.Controls.Text
{
    static PublishedDate()
    {
    }
    public PublishedDate()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        this.FontSize = 13f;
        this.TextColor = float4(0.6f, 0.6f, 0.6f, 1f);
        this.Margin = float4(10f, 0f, 10f, 0f);
    }
}
public partial class HorizontalBar: Fuse.Controls.Panel
{
    static HorizontalBar()
    {
    }
    public HorizontalBar()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        var temp = new Fuse.Controls.Rectangle();
        var temp1 = new Fuse.Drawing.StaticSolidColor(float4(0.8627451f, 0.8705882f, 0.8901961f, 1f));
        this.Alignment = Fuse.Elements.Alignment.VerticalCenter;
        this.Margin = float4(46f, 10f, 0f, 10f);
        temp.Height = 1f;
        temp.Fill = temp1;
        this.Children.Add(temp);
    }
}
public partial class MainView: Fuse.App
{
    public sealed class Fuse_Reactive_Each_object_Items_Property: Uno.UX.Property<object>
    {
        Fuse.Reactive.Each _obj;
        public Fuse_Reactive_Each_object_Items_Property(Fuse.Reactive.Each obj) { _obj = obj; }
        protected override object OnGet() { return _obj.Items; }
        protected override void OnSet(object v, object origin) { _obj.Items = v; }
    }
    public sealed class Fuse_Controls_TextControl_string_Value_Property: Uno.UX.Property<string>
    {
        Fuse.Controls.TextControl _obj;
        public Fuse_Controls_TextControl_string_Value_Property(Fuse.Controls.TextControl obj) { _obj = obj; }
        protected override string OnGet() { return _obj.Value; }
        protected override void OnSet(string v, object origin) { _obj.SetValue(v, origin); }
        protected override void OnAddListener(Uno.UX.ValueChangedHandler<string> listener) { _obj.ValueChanged += listener; }
        protected override void OnRemoveListener(Uno.UX.ValueChangedHandler<string> listener) { _obj.ValueChanged -= listener; }
    }
    public partial class Factory: Uno.UX.IFactory
    {
        internal readonly MainView __parent;
        public Factory(MainView parent)
        {
            __parent = parent;
        }
        MainView.Fuse_Controls_TextControl_string_Value_Property self_Value_inst;
        static Factory()
        {
        }
        public object New()
        {
            var self = new Header();
            self_Value_inst = new MainView.Fuse_Controls_TextControl_string_Value_Property(self);
            var temp = new Fuse.Reactive.DataBinding<string>(self_Value_inst, "status");
            self.Behaviors.Add(temp);
            return self;
        }
    }
    public partial class Factory1: Uno.UX.IFactory
    {
        internal readonly MainView __parent;
        public Factory1(MainView parent)
        {
            __parent = parent;
        }
        static Factory1()
        {
        }
        public object New()
        {
            var self = new HorizontalBar();
            return self;
        }
    }
    MainView.Fuse_Reactive_Each_object_Items_Property temp_Items_inst;
    static MainView()
    {
    }
    public MainView()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        var temp = new Fuse.Reactive.Each();
        temp_Items_inst = new MainView.Fuse_Reactive_Each_object_Items_Property(temp);
        var temp1 = new Fuse.Controls.DockPanel();
        var temp2 = new Fuse.Reactive.JavaScript();
        var temp3 = new Fuse.Controls.StatusBarBackground();
        var temp4 = new Fuse.Controls.BottomFrameBackground();
        var temp5 = new Fuse.Controls.StackPanel();
        var temp6 = new Fuse.Controls.Text();
        var temp7 = new Fuse.Controls.Rectangle();
        var temp8 = new Fuse.Drawing.StaticSolidColor(float4(0.2f, 0.2352941f, 0.282353f, 1f));
        var temp9 = new Fuse.Controls.ScrollView();
        var temp10 = new Fuse.Controls.StackPanel();
        var temp11 = new Fuse.Controls.Panel();
        var temp12 = new Factory(this);
        var temp13 = new Factory1(this);
        var temp14 = new Fuse.Reactive.DataBinding<object>(temp_Items_inst, "tracks.items.album");
        temp1.Children.Add(temp3);
        temp1.Children.Add(temp4);
        temp1.Children.Add(temp5);
        temp1.Children.Add(temp9);
        temp1.Behaviors.Add(temp2);
        temp2.Code = "var Observable = require(\"FuseJS/Observable\");\n\n\t\t\tvar data = Observable();\t\t\t\n\n\t\t\tvar xhr = new XMLHttpRequest();\n\t\t\txhr.open(\"GET\", \"https://www.codecademy.com/\", false);\n\t\t\txhr.send();\n\n\n\t\t\tfetch('https://api.spotify.com/v1/search?q=sandstorm&type=track')\n\t\t\t.then(function(response) { return response.json(); })\n\t\t\t.then(function(responseObject) { data.value = responseObject; });\n\n\t\t\tmodule.exports = {\n\t\t\t\tdataSource: data\n\t\t\t\tstatus: xhr.status\n\t\t\t};";
        temp2.LineNumber = 4;
        temp2.FileName = "MainView.ux";
        global::Fuse.Controls.DockPanel.SetDock(temp3, Fuse.Layouts.Dock.Top);
        global::Fuse.Controls.DockPanel.SetDock(temp4, Fuse.Layouts.Dock.Bottom);
        global::Fuse.Controls.DockPanel.SetDock(temp5, Fuse.Layouts.Dock.Top);
        temp5.Children.Add(temp6);
        temp5.Children.Add(temp7);
        temp6.Value = "NEWS";
        temp6.FontSize = 28f;
        temp6.TextAlignment = Fuse.Elements.TextAlignment.Center;
        temp6.Alignment = Fuse.Elements.Alignment.VerticalCenter;
        temp6.Padding = float4(2f, 2f, 2f, 2f);
        temp7.Height = 1f;
        temp7.Margin = float4(0f, 3f, 0f, 0f);
        temp7.Fill = temp8;
        temp9.Content = temp10;
        temp10.Alignment = Fuse.Elements.Alignment.Top;
        temp10.Children.Add(temp11);
        temp10.Behaviors.Add(temp14);
        temp10.Behaviors.Add(temp);
        temp11.Height = 7f;
        temp.Factories.Add(temp12);
        temp.Factories.Add(temp13);
        this.RootNode = temp1;
        this.Theme = Fuse.BasicTheme.BasicTheme.Singleton;
    }
}
