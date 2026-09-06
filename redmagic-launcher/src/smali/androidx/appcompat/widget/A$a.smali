.class Landroidx/appcompat/widget/A$a;
.super Landroidx/appcompat/widget/K;
.source "AppCompatSpinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/A;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/Resources$Theme;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic p:Landroidx/appcompat/widget/A$h;

.field final synthetic q:Landroidx/appcompat/widget/A;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/A;Landroid/view/View;Landroidx/appcompat/widget/A$h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/A$a;->q:Landroidx/appcompat/widget/A;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/appcompat/widget/A$a;->p:Landroidx/appcompat/widget/A$h;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroidx/appcompat/widget/K;-><init>(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Landroidx/appcompat/view/menu/p;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/A$a;->p:Landroidx/appcompat/widget/A$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/A$a;->q:Landroidx/appcompat/widget/A;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/A;->getInternalPopup()Landroidx/appcompat/widget/A$j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Landroidx/appcompat/widget/A$j;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/appcompat/widget/A$a;->q:Landroidx/appcompat/widget/A;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/widget/A;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method
