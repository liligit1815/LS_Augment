.class public final synthetic Lcom/android/quickstep/utils/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/utils/InterceptKeyEventHelper;

.field public final synthetic h:Z

.field public final synthetic i:Landroid/window/IRemoteTransitionInputCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;ZLandroid/window/IRemoteTransitionInputCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/utils/p;->g:Lcom/android/quickstep/utils/InterceptKeyEventHelper;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/utils/p;->h:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/utils/p;->i:Landroid/window/IRemoteTransitionInputCallback;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/p;->g:Lcom/android/quickstep/utils/InterceptKeyEventHelper;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/utils/p;->h:Z

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/utils/p;->i:Landroid/window/IRemoteTransitionInputCallback;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->a(Lcom/android/quickstep/utils/InterceptKeyEventHelper;ZLandroid/window/IRemoteTransitionInputCallback;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
