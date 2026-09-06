.class Landroidx/appcompat/widget/I$f;
.super Ljava/lang/Object;
.source "DropDownListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/I;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/widget/I;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/I;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/I$f;->g:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/I$f;->g:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Landroidx/appcompat/widget/I;->s:Landroidx/appcompat/widget/I$f;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/I$f;->g:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/I$f;->g:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Landroidx/appcompat/widget/I;->s:Landroidx/appcompat/widget/I$f;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/widget/I;->drawableStateChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
