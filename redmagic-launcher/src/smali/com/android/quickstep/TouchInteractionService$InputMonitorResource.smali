.class Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;
.super Lcom/android/quickstep/DisplayModel$DisplayResource;
.source "TouchInteractionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TouchInteractionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InputMonitorResource"
.end annotation


# instance fields
.field private final displayId:I

.field private final inputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

.field private final inputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/TouchInteractionService;I)V
    .locals 3

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/DisplayModel$DisplayResource;-><init>()V

    .line 3
    iput p2, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->displayId:I

    .line 4
    new-instance v0, Lcom/android/systemui/shared/system/InputMonitorCompat;

    const-string v1, "swipe-up"

    invoke-direct {v0, v1, p2}, Lcom/android/systemui/shared/system/InputMonitorCompat;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->o(Lcom/android/quickstep/TouchInteractionService;)Landroid/view/Choreographer;

    move-result-object v1

    new-instance v2, Lcom/android/quickstep/q6;

    invoke-direct {v2, p1}, Lcom/android/quickstep/q6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 6
    invoke-virtual {v0, p2, v1, v2}, Lcom/android/systemui/shared/system/InputMonitorCompat;->getInputReceiver(Landroid/os/Looper;Landroid/view/Choreographer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService;ILcom/android/quickstep/i7;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;-><init>(Lcom/android/quickstep/TouchInteractionService;I)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/TouchInteractionService;Landroid/view/InputEvent;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->A(Lcom/android/quickstep/TouchInteractionService;Landroid/view/InputEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;)Lcom/android/systemui/shared/system/InputMonitorCompat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public cleanup()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;->dispose()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/systemui/shared/system/InputMonitorCompat;->dispose()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "InputMonitorResource:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tdisplayId="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->displayId:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tinputMonitorCompat="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, "\tinputEventReceiver="

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->inputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method
