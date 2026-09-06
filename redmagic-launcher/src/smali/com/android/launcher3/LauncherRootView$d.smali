.class Lcom/android/launcher3/LauncherRootView$d;
.super Ljava/lang/Object;
.source "LauncherRootView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/LauncherRootView;->k(Lcom/android/launcher3/C2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView$d;->g:Lcom/android/launcher3/C2;

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
    .locals 2

    .line 1
    const-string v0, "LauncherRootView"

    .line 2
    .line 3
    const-string v1, "launcherOneShot: scaleUpWallPaperForOneShot "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView$d;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    const/high16 v0, 0x3f000000    # 0.5f

    .line 11
    .line 12
    invoke-static {p0, v0}, Lx1/O;->H4(Lcom/android/launcher3/C2;F)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
