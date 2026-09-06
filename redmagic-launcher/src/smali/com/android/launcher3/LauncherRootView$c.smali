.class Lcom/android/launcher3/LauncherRootView$c;
.super Ljava/lang/Object;
.source "LauncherRootView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/LauncherRootView;->j(Lcom/android/launcher3/C2;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Lcom/android/launcher3/LauncherRootView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/LauncherRootView$c;->i:Lcom/android/launcher3/LauncherRootView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView$c;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/LauncherRootView$c;->h:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView$c;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/LauncherRootView$c;->h:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "launcherOneShot: resetWallpaperAndOneShotView childCount_afterRemove= "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView$c;->i:Lcom/android/launcher3/LauncherRootView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "LauncherRootView"

    .line 36
    .line 37
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void
.end method
