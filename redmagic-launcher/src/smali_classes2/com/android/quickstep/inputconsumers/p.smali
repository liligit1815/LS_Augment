.class public final synthetic Lcom/android/quickstep/inputconsumers/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;

.field public final synthetic h:Landroid/content/Context;

.field public final synthetic i:Lcom/android/quickstep/GestureState;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;Landroid/content/Context;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/p;->g:Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/p;->h:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/p;->i:Lcom/android/quickstep/GestureState;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onMotionPauseDetected()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/p;->g:Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/p;->h:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/p;->i:Lcom/android/quickstep/GestureState;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->a(Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;Landroid/content/Context;Lcom/android/quickstep/GestureState;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
