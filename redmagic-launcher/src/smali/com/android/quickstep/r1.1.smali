.class public final synthetic Lcom/android/quickstep/r1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/window/BackProgressAnimator$ProgressCallback;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

.field public final synthetic b:Lcom/android/quickstep/LauncherBackAnimationController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/r1;->a:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/r1;->b:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onProgressUpdate(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/r1;->a:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/r1;->b:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->t2(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Lcom/android/quickstep/LauncherBackAnimationController;Landroid/window/BackEvent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
