.class public final synthetic Lcom/android/quickstep/util/m0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/systemui/shared/system/InputConsumerController$InputListener;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/InputConsumerProxy;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/InputConsumerProxy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/m0;->a:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onInputEvent(Landroid/view/InputEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/m0;->a:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/util/InputConsumerProxy;->a(Lcom/android/quickstep/util/InputConsumerProxy;Landroid/view/InputEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
