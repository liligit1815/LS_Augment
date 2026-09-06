.class public final synthetic Lcom/android/quickstep/q6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TouchInteractionService;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/q6;->a:Lcom/android/quickstep/TouchInteractionService;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onInputEvent(Landroid/view/InputEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/q6;->a:Lcom/android/quickstep/TouchInteractionService;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->a(Lcom/android/quickstep/TouchInteractionService;Landroid/view/InputEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
