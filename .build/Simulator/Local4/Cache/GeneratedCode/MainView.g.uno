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
            var temp = new Fuse.Reactive.DataBinding<string>(self_Value_inst, "title");
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
        MainView.Fuse_Controls_TextControl_string_Value_Property self_Value_inst;
        static Factory1()
        {
        }
        public object New()
        {
            var self = new Article();
            self_Value_inst = new MainView.Fuse_Controls_TextControl_string_Value_Property(self);
            var temp = new Fuse.Reactive.DataBinding<string>(self_Value_inst, "content");
            self.Behaviors.Add(temp);
            return self;
        }
    }
    public partial class Factory2: Uno.UX.IFactory
    {
        internal readonly MainView __parent;
        public Factory2(MainView parent)
        {
            __parent = parent;
        }
        MainView.Fuse_Controls_TextControl_string_Value_Property self_Value_inst;
        static Factory2()
        {
        }
        public object New()
        {
            var self = new PublishedDate();
            self_Value_inst = new MainView.Fuse_Controls_TextControl_string_Value_Property(self);
            var temp = new Fuse.Reactive.DataBinding<string>(self_Value_inst, "publishedDate");
            self.Behaviors.Add(temp);
            return self;
        }
    }
    public partial class Factory3: Uno.UX.IFactory
    {
        internal readonly MainView __parent;
        public Factory3(MainView parent)
        {
            __parent = parent;
        }
        static Factory3()
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
        var temp1 = new Fuse.Controls.WrapPanel();
        var temp2 = new Fuse.Reactive.JavaScript();
        var temp3 = new Fuse.Controls.WrapPanel();
        var temp4 = new Fuse.Controls.TextInput();
        var temp5 = new Fuse.Controls.Button();
        var temp6 = new Fuse.Controls.WrapPanel();
        var temp7 = new Fuse.Controls.ScrollView();
        var temp8 = new Fuse.Controls.StackPanel();
        var temp9 = new Fuse.Controls.Panel();
        var temp10 = new Factory(this);
        var temp11 = new Factory1(this);
        var temp12 = new Factory2(this);
        var temp13 = new Factory3(this);
        var temp14 = new Fuse.Reactive.DataBinding<object>(temp_Items_inst, "dataSource.responseData.feed.entries");
        temp1.Orientation = Fuse.Layouts.Orientation.Vertical;
        temp1.Children.Add(temp3);
        temp1.Children.Add(temp6);
        temp1.Behaviors.Add(temp2);
        temp2.Code = "var Observable = require(\"FuseJS/Observable\");\n\n\t\t\tvar data = Observable();\t\t\t\n\n\t\t\tfetch('https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.digg.com/rss/index.xml')\n\t\t\t.then(function(response) { return response.json(); })\n\t\t\t.then(function(responseObject) { data.value = responseObject; });\n\n\t\t\tmodule.exports = {\n\t\t\t\tdataSource: data\n\t\t\t};";
        temp2.LineNumber = 3;
        temp2.FileName = "MainView.ux";
        temp3.FlowDirection = Fuse.Layouts.FlowDirection.LeftToRight;
        temp3.Children.Add(temp4);
        temp3.Children.Add(temp5);
        temp4.PlaceholderText = "Search";
        temp4.PlaceholderColor = float4(0.2313726f, 0.2313726f, 0.2313726f, 1f);
        temp4.Width = 225f;
        temp4.Margin = float4(20f, 20f, 20f, 20f);
        temp5.Width = 10f;
        temp5.Height = 10f;
        temp5.Alignment = Fuse.Elements.Alignment.TopRight;
        temp6.Orientation = Fuse.Layouts.Orientation.Vertical;
        temp6.Children.Add(temp7);
        temp7.Content = temp8;
        temp8.Alignment = Fuse.Elements.Alignment.Top;
        temp8.Children.Add(temp9);
        temp8.Behaviors.Add(temp14);
        temp8.Behaviors.Add(temp);
        temp9.Height = 7f;
        temp.Factories.Add(temp10);
        temp.Factories.Add(temp11);
        temp.Factories.Add(temp12);
        temp.Factories.Add(temp13);
        this.RootNode = temp1;
        this.Theme = Fuse.BasicTheme.BasicTheme.Singleton;
    }
}
