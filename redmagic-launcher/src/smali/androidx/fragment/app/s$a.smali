.class Landroidx/fragment/app/s$a;
.super Landroidx/fragment/app/x;
.source "FragmentActivity.java"

# interfaces
.implements Lz/b;
.implements Lz/c;
.implements Landroidx/core/app/m;
.implements Landroidx/core/app/n;
.implements LW/p;
.implements Landroidx/activity/r;
.implements Lc/e;
.implements Le0/f;
.implements Landroidx/fragment/app/J;
.implements LJ/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/fragment/app/x<",
        "Landroidx/fragment/app/s;",
        ">;",
        "Lz/b;",
        "Lz/c;",
        "Landroidx/core/app/m;",
        "Landroidx/core/app/n;",
        "LW/p;",
        "Landroidx/activity/r;",
        "Lc/e;",
        "Le0/f;",
        "Landroidx/fragment/app/J;",
        "LJ/l;"
    }
.end annotation


# instance fields
.field final synthetic l:Landroidx/fragment/app/s;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroidx/fragment/app/x;-><init>(Landroidx/fragment/app/s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/fragment/app/F;Landroidx/fragment/app/n;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroidx/fragment/app/s;->onAttachFragment(Landroidx/fragment/app/n;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addMenuProvider(LJ/q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->addMenuProvider(LJ/q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addOnConfigurationChangedListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroid/content/res/Configuration;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->addOnConfigurationChangedListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addOnMultiWindowModeChangedListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroidx/core/app/f;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->addOnMultiWindowModeChangedListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addOnPictureInPictureModeChangedListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroidx/core/app/p;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->addOnPictureInPictureModeChangedListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addOnTrimMemoryListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->addOnTrimMemoryListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public getActivityResultRegistry()Lc/d;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/h;->getActivityResultRegistry()Lc/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLifecycle()Landroidx/lifecycle/g;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/s;->mFragmentLifecycleRegistry:Landroidx/lifecycle/i;

    .line 4
    .line 5
    return-object p0
.end method

.method public getOnBackPressedDispatcher()Landroidx/activity/p;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/h;->getOnBackPressedDispatcher()Landroidx/activity/p;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSavedStateRegistry()Le0/d;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/h;->getSavedStateRegistry()Le0/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getViewModelStore()LW/o;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/h;->getViewModelStore()LW/o;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/fragment/app/s;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic k()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/s$a;->t()Landroidx/fragment/app/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Landroid/view/LayoutInflater;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public o(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroidx/core/app/a;->s(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/s$a;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public removeMenuProvider(LJ/q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->removeMenuProvider(LJ/q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeOnConfigurationChangedListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroid/content/res/Configuration;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->removeOnConfigurationChangedListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeOnMultiWindowModeChangedListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroidx/core/app/f;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->removeOnMultiWindowModeChangedListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeOnPictureInPictureModeChangedListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroidx/core/app/p;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->removeOnPictureInPictureModeChangedListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeOnTrimMemoryListener(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/h;->removeOnTrimMemoryListener(LI/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/h;->invalidateMenu()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()Landroidx/fragment/app/s;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/s$a;->l:Landroidx/fragment/app/s;

    .line 2
    .line 3
    return-object p0
.end method
