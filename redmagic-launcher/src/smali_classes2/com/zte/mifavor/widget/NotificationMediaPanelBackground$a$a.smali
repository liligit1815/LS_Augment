.class Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;
.super Landroid/view/ViewOutlineProvider;
.source "NotificationMediaPanelBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;->a:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;->a:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->a(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;)Landroid/graphics/Path;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;->a:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->a(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;)Landroid/graphics/Path;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/graphics/Path;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;->a:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->a(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;)Landroid/graphics/Path;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p2, p0}, Landroid/graphics/Outline;->setPath(Landroid/graphics/Path;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
