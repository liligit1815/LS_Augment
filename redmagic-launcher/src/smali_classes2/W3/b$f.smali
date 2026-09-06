.class LW3/b$f;
.super Ljava/lang/Object;
.source "BaseSinkActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW3/b;->U()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LW3/b;


# direct methods
.method constructor <init>(LW3/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3/b$f;->g:LW3/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, LW3/b$f;->g:LW3/b;

    .line 2
    .line 3
    iget-object v0, v0, LW3/b;->j:Landroidx/appcompat/widget/Toolbar;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_1

    .line 11
    .line 12
    iget-object v2, p0, LW3/b$f;->g:LW3/b;

    .line 13
    .line 14
    iget-object v2, v2, LW3/b;->j:Landroidx/appcompat/widget/Toolbar;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    instance-of v3, v2, Landroidx/appcompat/widget/ActionMenuView;

    .line 23
    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, LW3/b$f;->g:LW3/b;

    .line 27
    .line 28
    invoke-static {p0, v2}, LW3/b;->I(LW3/b;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method
