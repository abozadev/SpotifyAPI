public partial class MainView: Fuse.App
{
    internal Fuse.Controls.TextInput input;
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
        input = new Fuse.Controls.TextInput();
        temp.Children.Add(input);
        input.Name = "input";
        this.RootNode = temp;
        this.Theme = Fuse.BasicTheme.BasicTheme.Singleton;
    }
}
