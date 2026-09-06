.class public Lcom/android/quickstep/util/AssistContentRequester;
.super Ljava/lang/Object;
.source "AssistContentRequester.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/AssistContentRequester$Callback;,
        Lcom/android/quickstep/util/AssistContentRequester$AssistDataReceiver;
    }
.end annotation


# static fields
.field private static final ASSIST_KEY_CONTENT:Ljava/lang/String; = "content"

.field private static final TAG:Ljava/lang/String; = "AssistContentRequester"


# instance fields
.field private final mActivityTaskManager:Landroid/app/IActivityTaskManager;

.field private final mAttributionTag:Ljava/lang/String;

.field private final mCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final mPackageName:Ljava/lang/String;

.field private final mPendingCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/android/quickstep/util/AssistContentRequester$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private final mSystemInteractionExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mPendingCallbacks:Ljava/util/Map;

    .line 14
    .line 15
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mActivityTaskManager:Landroid/app/IActivityTaskManager;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getAttributionTag()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mAttributionTag:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/android/quickstep/util/AssistContentRequester;->mPackageName:Ljava/lang/String;

    .line 36
    .line 37
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/android/quickstep/util/AssistContentRequester;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 40
    .line 41
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/android/quickstep/util/AssistContentRequester;->mSystemInteractionExecutor:Ljava/util/concurrent/Executor;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/AssistContentRequester;Lcom/android/quickstep/util/AssistContentRequester$Callback;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/AssistContentRequester;->lambda$requestAssistContent$0(Lcom/android/quickstep/util/AssistContentRequester$Callback;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/AssistContentRequester;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mPendingCallbacks:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/AssistContentRequester;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/AssistContentRequester;->executeOnMainExecutor(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private executeOnMainExecutor(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$requestAssistContent$0(Lcom/android/quickstep/util/AssistContentRequester$Callback;I)V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mActivityTaskManager:Landroid/app/IActivityTaskManager;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/AssistContentRequester$AssistDataReceiver;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0}, Lcom/android/quickstep/util/AssistContentRequester$AssistDataReceiver;-><init>(Lcom/android/quickstep/util/AssistContentRequester$Callback;Lcom/android/quickstep/util/AssistContentRequester;)V

    .line 6
    .line 7
    .line 8
    iget-object v3, p0, Lcom/android/quickstep/util/AssistContentRequester;->mPackageName:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/android/quickstep/util/AssistContentRequester;->mAttributionTag:Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    move v2, p2

    .line 14
    :try_start_1
    invoke-interface/range {v0 .. v5}, Landroid/app/IActivityTaskManager;->requestAssistDataForTask(Landroid/app/IAssistDataReceiver;ILjava/lang/String;Ljava/lang/String;Z)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception v0

    .line 19
    :goto_0
    move-object p0, v0

    .line 20
    goto :goto_1

    .line 21
    :catch_1
    move-exception v0

    .line 22
    move v2, p2

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string p2, "Requesting assist content failed for task: "

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string p2, "AssistContentRequester"

    .line 42
    .line 43
    invoke-static {p2, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public requestAssistContent(ILcom/android/quickstep/util/AssistContentRequester$Callback;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AssistContentRequester;->mSystemInteractionExecutor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/x;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Lcom/android/quickstep/util/x;-><init>(Lcom/android/quickstep/util/AssistContentRequester;Lcom/android/quickstep/util/AssistContentRequester$Callback;I)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
