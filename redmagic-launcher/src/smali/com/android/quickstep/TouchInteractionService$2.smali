.class Lcom/android/quickstep/TouchInteractionService$2;
.super Landroid/content/IIntentSender$Stub;
.source "TouchInteractionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TouchInteractionService;->createAllAppsPendingIntent()Landroid/app/PendingIntent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/TouchInteractionService;


# direct methods
.method constructor <init>(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService$2;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/IIntentSender$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$send$0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService$2;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/TouchInteractionService;->t(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/launcher3/taskbar/g3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$2;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->t(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/launcher3/taskbar/g3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->T0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/TouchInteractionService$2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService$2;->lambda$send$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public send(ILandroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Landroid/content/IIntentReceiver;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance p2, Lcom/android/quickstep/p6;

    .line 4
    .line 5
    invoke-direct {p2, p0}, Lcom/android/quickstep/p6;-><init>(Lcom/android/quickstep/TouchInteractionService$2;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
