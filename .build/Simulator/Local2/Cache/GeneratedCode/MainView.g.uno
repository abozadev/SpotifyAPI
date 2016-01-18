public partial class MainView: Fuse.App
{
    static MainView()
    {
    }
    public MainView()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        var temp = new Fuse.Controls.Panel();
        var temp1 = new Fuse.Controls.TextInput();
        var temp2 = new Fuse.Controls.Button();
        var temp3 = new Fuse.Controls.Panel();
        temp.Children.Add(temp1);
        temp.Children.Add(temp2);
        temp1.PlaceholderText = "Search";
        temp1.PlaceholderColor = float4(0.2313726f, 0.2313726f, 0.2313726f, 1f);
        Fuse.Elements.Element.WidthProperty.Set(temp1, 70f, global::Fuse.Elements.SizeUnit.Percent);
        temp1.Margin = float4(20f, 20f, 20f, 20f);
        temp2.Text = "Search";
        temp2.Alignment = Fuse.Elements.Alignment.TopRight;
        this.RootNode = temp3;
        this.Theme = Fuse.BasicTheme.BasicTheme.Singleton;
    }
}
