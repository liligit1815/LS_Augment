.class public final Lcom/android/quickstep/OverviewCommandHelper;
.super Ljava/lang/Object;
.source "OverviewCommandHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;,
        Lcom/android/quickstep/OverviewCommandHelper$CommandType;,
        Lcom/android/quickstep/OverviewCommandHelper$Companion;,
        Lcom/android/quickstep/OverviewCommandHelper$WhenMappings;
    }
.end annotation


# static fields
.field private static final COMMAND_MAX_COUNT:I = 0x2

.field public static final Companion:Lcom/android/quickstep/OverviewCommandHelper$Companion;

.field private static final MAX_QUEUE_SIZE:I = 0x3

.field private static final MIPOP_APP_SWITCH_FLAG:Ljava/lang/String; = "MIPop_app_switch"

.field private static final QUEUE_WAIT_DURATION_IN_MS:J = 0x1388L

.field private static final TAG:Ljava/lang/String; = "OverviewCommandHelper"

.field private static final TRANSITION_NAME:Ljava/lang/String; = "Transition:toOverview"

.field private static mMiPopAppSwitchCount:I


# instance fields
.field private final commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final coroutineScope:LF4/I;

.field private final dispatcherProvider:Li2/b;

.field private final focusState:Lcom/android/quickstep/FocusState;

.field private keyboardTaskFocusIndex:I

.field private final overviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

.field private final recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

.field private final systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

.field private final taskbarManager:Lcom/android/launcher3/taskbar/g3;

.field private final touchInteractionService:Lcom/android/quickstep/TouchInteractionService;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/OverviewCommandHelper$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/OverviewCommandHelper$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/OverviewCommandHelper;->Companion:Lcom/android/quickstep/OverviewCommandHelper$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/quickstep/FocusState;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 11

    .line 1
    const-string v0, "touchInteractionService"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "overviewComponentObserver"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "recentsDisplayModel"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "focusState"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "taskbarManager"

    move-object/from16 v7, p5

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "systemUiProxy"

    move-object/from16 v8, p6

    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v9, 0x4

    const/4 v10, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v10}, Lcom/android/quickstep/OverviewCommandHelper;-><init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/OverviewComponentObserver;Li2/b;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/quickstep/FocusState;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/SystemUiProxy;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/OverviewComponentObserver;Li2/b;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/quickstep/FocusState;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 1

    const-string v0, "touchInteractionService"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "overviewComponentObserver"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dispatcherProvider"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "recentsDisplayModel"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "focusState"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "taskbarManager"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "systemUiProxy"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 4
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper;->overviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 5
    iput-object p3, p0, Lcom/android/quickstep/OverviewCommandHelper;->dispatcherProvider:Li2/b;

    .line 6
    iput-object p4, p0, Lcom/android/quickstep/OverviewCommandHelper;->recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 7
    iput-object p5, p0, Lcom/android/quickstep/OverviewCommandHelper;->focusState:Lcom/android/quickstep/FocusState;

    .line 8
    iput-object p6, p0, Lcom/android/quickstep/OverviewCommandHelper;->taskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 9
    iput-object p7, p0, Lcom/android/quickstep/OverviewCommandHelper;->systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    const/4 p1, 0x0

    const/4 p2, 0x1

    .line 10
    invoke-static {p1, p2, p1}, LF4/M0;->b(LF4/u0;ILjava/lang/Object;)LF4/t;

    move-result-object p1

    invoke-interface {p3}, Li2/b;->getBackground()LF4/E;

    move-result-object p2

    invoke-interface {p1, p2}, Ll4/g;->J(Ll4/g;)Ll4/g;

    move-result-object p1

    invoke-static {p1}, LF4/J;->a(Ll4/g;)LF4/I;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->coroutineScope:LF4/I;

    .line 11
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    const/4 p1, -0x2

    .line 12
    iput p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/OverviewComponentObserver;Li2/b;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/quickstep/FocusState;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/SystemUiProxy;ILkotlin/jvm/internal/j;)V
    .locals 8

    and-int/lit8 v0, p8, 0x4

    if-eqz v0, :cond_0

    .line 13
    sget-object p3, Li2/c;->a:Li2/c;

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object v7, p7

    .line 14
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/OverviewCommandHelper;-><init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/OverviewComponentObserver;Li2/b;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/quickstep/FocusState;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/SystemUiProxy;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/OverviewCommandHelper;->clearPendingCommands$lambda$6(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$cancelCommand(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->cancelCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$executeCommandSuspended(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->executeCommandSuspended(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$executeCommandSuspended$lambda$9$processResult(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/OverviewCommandHelper;->executeCommandSuspended$lambda$9$processResult(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$logShowOverviewFrom(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->logShowOverviewFrom(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$onCommandFinished(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->onCommandFinished(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$onRecentsViewFocusUpdated(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->onRecentsViewFocusUpdated(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$processNextCommand(Lcom/android/quickstep/OverviewCommandHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/OverviewCommandHelper;->processNextCommand()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$updateRecentsViewFocus(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->updateRecentsViewFocus(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic addCommand$default(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZILjava/lang/Object;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x2

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 7
    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZ)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private static final addCommand$lambda$0(Lcom/android/launcher3/views/k;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-interface {p0, v0, v1}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private static final addCommand$lambda$1(Lcom/android/quickstep/OverviewCommandHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/OverviewCommandHelper;->processNextCommand()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/OverviewCommandHelper;->requestFocus$lambda$14(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;Lu4/a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/OverviewCommandHelper;->executeWhenRecentsIsNotVisible$lambda$12(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;Lu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final cancelCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;->CANCELED:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->setStatus(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "command cancelled: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " - "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string v0, "OverviewCommandHelper"

    .line 32
    .line 33
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 37
    .line 38
    invoke-virtual {p2, p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;->remove(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->finishRecentsAnimation(I)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/quickstep/OverviewCommandHelper;->processNextCommand()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private static final clearPendingCommands$lambda$6(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getStatus()Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;->PROCESSING:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/views/k;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand$lambda$0(Lcom/android/launcher3/views/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->launchTask$lambda$10(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final executeCommandSuspended(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, LF4/l;

    .line 2
    .line 3
    invoke-static {p2}, Lm4/b;->c(Ll4/d;)Ll4/d;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2}, LF4/l;-><init>(Ll4/d;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, LF4/l;->D()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lkotlin/jvm/internal/z;

    .line 15
    .line 16
    invoke-direct {v1}, Lkotlin/jvm/internal/z;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;

    .line 20
    .line 21
    invoke-direct {v2, p1, v1, v0}, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, v2}, Lcom/android/quickstep/OverviewCommandHelper;->executeCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {p1, v1, v0, v2}, Lcom/android/quickstep/OverviewCommandHelper;->access$executeCommandSuspended$lambda$9$processResult(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;Z)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1, v1}, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v2}, LF4/k;->f(Lu4/l;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, LF4/l;->x()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-ne p0, p1, :cond_0

    .line 48
    .line 49
    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-ne p0, p1, :cond_1

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 60
    .line 61
    return-object p0
.end method

.method private static final executeCommandSuspended$lambda$9$processResult(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lkotlin/jvm/internal/z;",
            "LF4/k<",
            "-",
            "Lh4/t;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p1, Lkotlin/jvm/internal/z;->g:Z

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "command executed: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, " with result: "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, " with isResumed: "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "OverviewCommandHelper"

    .line 37
    .line 38
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-boolean v0, p1, Lkotlin/jvm/internal/z;->g:Z

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    if-eqz p3, :cond_1

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    iput-boolean p0, p1, Lkotlin/jvm/internal/z;->g:Z

    .line 50
    .line 51
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 52
    .line 53
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 54
    .line 55
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p2, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string p2, "waiting for command callback: "

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private final executeWhenRecentsIsNotVisible(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v3, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v0, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-direct {v3, v2}, Lcom/android/quickstep/OverviewCommandHelper;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    check-cast v6, Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v6, 0x0

    .line 29
    :goto_0
    if-eqz v4, :cond_1

    .line 30
    .line 31
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    const/4 v4, 0x0

    .line 37
    :goto_1
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    iget-object v8, v3, Lcom/android/quickstep/OverviewCommandHelper;->focusState:Lcom/android/quickstep/FocusState;

    .line 42
    .line 43
    invoke-virtual {v8}, Lcom/android/quickstep/FocusState;->getFocusedDisplayId()I

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    sget-object v9, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 48
    .line 49
    invoke-virtual {v9}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    const-string v11, "OverviewCommandHelper"

    .line 54
    .line 55
    if-eqz v10, :cond_3

    .line 56
    .line 57
    new-instance v10, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v12, "Querying RecentsDisplayModel for TaskbarUIController for display: "

    .line 63
    .line 64
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    invoke-static {v11, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    iget-object v10, v3, Lcom/android/quickstep/OverviewCommandHelper;->recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 78
    .line 79
    invoke-virtual {v10, v8}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 80
    .line 81
    .line 82
    move-result-object v10

    .line 83
    if-eqz v10, :cond_2

    .line 84
    .line 85
    invoke-virtual {v10}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getTaskbarUIController()Lcom/android/launcher3/taskbar/o4;

    .line 86
    .line 87
    .line 88
    move-result-object v10

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    const/4 v10, 0x0

    .line 91
    goto :goto_2

    .line 92
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v12, "Querying TaskbarManager for TaskbarUIController for display: "

    .line 98
    .line 99
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    invoke-static {v11, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    iget-object v10, v3, Lcom/android/quickstep/OverviewCommandHelper;->taskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 113
    .line 114
    invoke-virtual {v10, v8}, Lcom/android/launcher3/taskbar/g3;->j0(I)Lcom/android/launcher3/taskbar/o4;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    :goto_2
    if-nez v10, :cond_4

    .line 119
    .line 120
    const-string v12, " not"

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_4
    const-string v12, ""

    .line 124
    .line 125
    :goto_3
    new-instance v13, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v14, "TaskbarUIController for display "

    .line 131
    .line 132
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v14, " was"

    .line 139
    .line 140
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v12, " found"

    .line 147
    .line 148
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v12

    .line 155
    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 159
    .line 160
    .line 161
    move-result-object v12

    .line 162
    new-instance v13, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string v14, "RecentsView null , command.type="

    .line 168
    .line 169
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v12

    .line 179
    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 183
    .line 184
    .line 185
    move-result-object v12

    .line 186
    sget-object v13, Lcom/android/quickstep/OverviewCommandHelper$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 187
    .line 188
    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    .line 189
    .line 190
    .line 191
    move-result v12

    .line 192
    aget v12, v13, v12

    .line 193
    .line 194
    const/4 v13, -0x2

    .line 195
    const/4 v14, 0x2

    .line 196
    const/4 v15, 0x0

    .line 197
    const/4 v5, 0x1

    .line 198
    if-eq v12, v5, :cond_d

    .line 199
    .line 200
    if-eq v12, v14, :cond_a

    .line 201
    .line 202
    const/4 v14, 0x3

    .line 203
    if-eq v12, v14, :cond_6

    .line 204
    .line 205
    const/4 v4, 0x4

    .line 206
    if-eq v12, v4, :cond_e

    .line 207
    .line 208
    const/4 v0, 0x5

    .line 209
    if-ne v12, v0, :cond_5

    .line 210
    .line 211
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logExecuteHomeCommand()V

    .line 212
    .line 213
    .line 214
    iget-object v0, v3, Lcom/android/quickstep/OverviewCommandHelper;->systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 215
    .line 216
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    invoke-virtual {v0, v14, v1}, Lcom/android/quickstep/SystemUiProxy;->onKeyEvent(II)V

    .line 221
    .line 222
    .line 223
    return v5

    .line 224
    :cond_5
    new-instance v0, Lh4/j;

    .line 225
    .line 226
    invoke-direct {v0}, Lh4/j;-><init>()V

    .line 227
    .line 228
    .line 229
    throw v0

    .line 230
    :cond_6
    if-eqz v7, :cond_9

    .line 231
    .line 232
    if-eqz v4, :cond_7

    .line 233
    .line 234
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->G0:Z

    .line 235
    .line 236
    if-nez v4, :cond_7

    .line 237
    .line 238
    goto :goto_5

    .line 239
    :cond_7
    invoke-static {}, Lcom/android/launcher3/y0;->h()Z

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    if-eqz v4, :cond_8

    .line 244
    .line 245
    if-eqz v10, :cond_8

    .line 246
    .line 247
    invoke-virtual {v10}, Lcom/android/launcher3/taskbar/o4;->z()I

    .line 248
    .line 249
    .line 250
    move-result v4

    .line 251
    goto :goto_4

    .line 252
    :cond_8
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/o4;->z()I

    .line 253
    .line 254
    .line 255
    move-result v4

    .line 256
    :goto_4
    iput v4, v3, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 257
    .line 258
    if-ne v4, v13, :cond_e

    .line 259
    .line 260
    :cond_9
    :goto_5
    return v5

    .line 261
    :cond_a
    if-eqz v7, :cond_c

    .line 262
    .line 263
    if-eqz v4, :cond_c

    .line 264
    .line 265
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->G0:Z

    .line 266
    .line 267
    if-ne v4, v5, :cond_c

    .line 268
    .line 269
    invoke-static {}, Lcom/android/launcher3/y0;->h()Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-eqz v0, :cond_b

    .line 274
    .line 275
    if-eqz v10, :cond_b

    .line 276
    .line 277
    invoke-virtual {v10}, Lcom/android/launcher3/taskbar/o4;->J()V

    .line 278
    .line 279
    .line 280
    goto :goto_6

    .line 281
    :cond_b
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/o4;->J()V

    .line 282
    .line 283
    .line 284
    :goto_6
    return v5

    .line 285
    :cond_c
    iput v15, v3, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 286
    .line 287
    goto :goto_7

    .line 288
    :cond_d
    iput v15, v3, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 289
    .line 290
    :cond_e
    :goto_7
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 291
    .line 292
    .line 293
    move-result-object v4

    .line 294
    sget-object v7, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->TOGGLE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 295
    .line 296
    if-ne v4, v7, :cond_f

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getMiPopAppSwitchSeq()I

    .line 299
    .line 300
    .line 301
    move-result v4

    .line 302
    const/4 v7, 0x2

    .line 303
    if-ne v4, v7, :cond_f

    .line 304
    .line 305
    const-string v0, "Omit the second toggle command of mipop"

    .line 306
    .line 307
    invoke-static {v11, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    .line 309
    .line 310
    return v5

    .line 311
    :cond_f
    if-eqz v6, :cond_10

    .line 312
    .line 313
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    const-string v7, "getTaskViews(...)"

    .line 318
    .line 319
    invoke-static {v4, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    iget v7, v3, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 323
    .line 324
    invoke-static {v4, v7}, Li4/m;->V(Ljava/lang/Iterable;I)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    check-cast v4, Landroid/view/View;

    .line 329
    .line 330
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 331
    .line 332
    .line 333
    move-result v4

    .line 334
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    goto :goto_8

    .line 339
    :cond_10
    const/4 v4, 0x0

    .line 340
    :goto_8
    if-eqz v4, :cond_11

    .line 341
    .line 342
    const/4 v7, -0x1

    .line 343
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 344
    .line 345
    .line 346
    move-result v10

    .line 347
    if-ne v10, v7, :cond_12

    .line 348
    .line 349
    :cond_11
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    :cond_12
    if-eqz v6, :cond_13

    .line 354
    .line 355
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 356
    .line 357
    .line 358
    move-result v4

    .line 359
    invoke-virtual {v6, v4}, Lcom/android/quickstep/views/RecentsView;->setKeyboardTaskFocusIndex(I)V

    .line 360
    .line 361
    .line 362
    :cond_13
    if-eqz v6, :cond_14

    .line 363
    .line 364
    invoke-virtual {v6, v5}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 365
    .line 366
    .line 367
    :cond_14
    new-instance v4, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;

    .line 368
    .line 369
    invoke-direct {v4, v1, v3, v0}, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/OverviewCommandHelper;Lu4/a;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v2, v4}, Lcom/android/quickstep/BaseContainerInterface;->switchToRecentsIfVisible(Landroid/animation/Animator$AnimatorListener;)Z

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    if-eqz v4, :cond_15

    .line 377
    .line 378
    new-instance v0, Ljava/lang/StringBuilder;

    .line 379
    .line 380
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 381
    .line 382
    .line 383
    const-string v2, "switching to Overview state - waiting: "

    .line 384
    .line 385
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-static {v11, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    .line 397
    .line 398
    return v15

    .line 399
    :cond_15
    invoke-virtual {v9}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 400
    .line 401
    .line 402
    move-result v4

    .line 403
    if-nez v4, :cond_16

    .line 404
    .line 405
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    if-eqz v4, :cond_16

    .line 410
    .line 411
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    if-eqz v4, :cond_16

    .line 416
    .line 417
    const/16 v7, 0xb

    .line 418
    .line 419
    invoke-static {v4, v7}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 420
    .line 421
    .line 422
    :cond_16
    iget-object v4, v3, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 423
    .line 424
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 425
    .line 426
    .line 427
    move-result v7

    .line 428
    sget-object v9, Lcom/android/quickstep/GestureState;->DEFAULT_STATE:Lcom/android/quickstep/GestureState;

    .line 429
    .line 430
    sget-object v10, Lcom/android/quickstep/GestureState$TrackpadGestureType;->NONE:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 431
    .line 432
    const/4 v12, 0x0

    .line 433
    invoke-virtual {v4, v7, v9, v10, v12}, Lcom/android/quickstep/TouchInteractionService;->createGestureState(ILcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState$TrackpadGestureType;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Lcom/android/quickstep/GestureState;

    .line 434
    .line 435
    .line 436
    move-result-object v7

    .line 437
    invoke-virtual {v7, v5}, Lcom/android/quickstep/GestureState;->setHandlingAtomicEvent(Z)V

    .line 438
    .line 439
    .line 440
    iget-object v4, v3, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 441
    .line 442
    invoke-virtual {v4, v8}, Lcom/android/quickstep/TouchInteractionService;->getSwipeUpHandlerFactory(I)Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 443
    .line 444
    .line 445
    move-result-object v4

    .line 446
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getCreateTime()J

    .line 447
    .line 448
    .line 449
    move-result-wide v8

    .line 450
    invoke-interface {v4, v7, v8, v9}, Lcom/android/quickstep/AbsSwipeUpHandler$Factory;->newHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 451
    .line 452
    .line 453
    move-result-object v4

    .line 454
    new-instance v8, Lcom/android/quickstep/I1;

    .line 455
    .line 456
    invoke-direct {v8, v3, v1, v4, v0}, Lcom/android/quickstep/I1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;Lu4/a;)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v4, v8}, Lcom/android/quickstep/AbsSwipeUpHandler;->setGestureEndCallback(Ljava/lang/Runnable;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    new-instance v8, Ljava/lang/StringBuilder;

    .line 467
    .line 468
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 469
    .line 470
    .line 471
    const-string v9, "OverviewCommandHelper: command.type="

    .line 472
    .line 473
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    invoke-virtual {v4, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->initWhenReady(Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->playBackGroundAnim()V

    .line 487
    .line 488
    .line 489
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 490
    .line 491
    iget-object v8, v3, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 492
    .line 493
    invoke-virtual {v8}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 494
    .line 495
    .line 496
    move-result-object v8

    .line 497
    invoke-virtual {v0, v8}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    move-result-object v0

    .line 501
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 502
    .line 503
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 504
    .line 505
    .line 506
    move-result-object v8

    .line 507
    invoke-virtual {v8}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 508
    .line 509
    .line 510
    move-result-object v8

    .line 511
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 512
    .line 513
    .line 514
    move-result-object v9

    .line 515
    if-eqz v9, :cond_17

    .line 516
    .line 517
    if-eqz v8, :cond_17

    .line 518
    .line 519
    invoke-virtual {v8}, Landroid/animation/AnimatorSet;->cancel()V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 523
    .line 524
    .line 525
    move-result-object v8

    .line 526
    invoke-static {v8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 527
    .line 528
    .line 529
    invoke-interface {v8}, Lcom/android/launcher3/views/k;->resetDraglayer()V

    .line 530
    .line 531
    .line 532
    :cond_17
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    invoke-virtual {v0}, Lu2/e;->h()V

    .line 537
    .line 538
    .line 539
    new-instance v0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;

    .line 540
    .line 541
    move-object/from16 v16, v6

    .line 542
    .line 543
    move v6, v5

    .line 544
    move-object/from16 v5, v16

    .line 545
    .line 546
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/BaseContainerInterface;Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/views/RecentsView;)V

    .line 547
    .line 548
    .line 549
    iget-object v2, v3, Lcom/android/quickstep/OverviewCommandHelper;->recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 550
    .line 551
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 552
    .line 553
    .line 554
    move-result v3

    .line 555
    invoke-virtual {v2, v3}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 556
    .line 557
    .line 558
    move-result-object v2

    .line 559
    if-nez v2, :cond_18

    .line 560
    .line 561
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 562
    .line 563
    .line 564
    move-result v0

    .line 565
    new-instance v2, Ljava/lang/StringBuilder;

    .line 566
    .line 567
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 568
    .line 569
    .line 570
    const-string v3, "No TaskAnimationManager found for display "

    .line 571
    .line 572
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    .line 584
    .line 585
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnTaskAnimationManagerNotAvailable(I)V

    .line 590
    .line 591
    .line 592
    return v15

    .line 593
    :cond_18
    invoke-virtual {v2}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 594
    .line 595
    .line 596
    move-result v3

    .line 597
    new-instance v5, Ljava/lang/StringBuilder;

    .line 598
    .line 599
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 600
    .line 601
    .line 602
    const-string v8, "executeCommand: RecentsAnimationRunning = "

    .line 603
    .line 604
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    .line 606
    .line 607
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 608
    .line 609
    .line 610
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v3

    .line 614
    invoke-static {v11, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    .line 616
    .line 617
    invoke-virtual {v2}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    if-eqz v3, :cond_19

    .line 622
    .line 623
    invoke-virtual {v2, v7}, Lcom/android/quickstep/TaskAnimationManager;->continueRecentsAnimation(Lcom/android/quickstep/GestureState;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 624
    .line 625
    .line 626
    move-result-object v3

    .line 627
    const-string v5, "continueRecentsAnimation(...)"

    .line 628
    .line 629
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 630
    .line 631
    .line 632
    invoke-virtual {v1, v3}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->setAnimationCallbacks(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 633
    .line 634
    .line 635
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {v1, v4}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 639
    .line 640
    .line 641
    invoke-virtual {v2, v4}, Lcom/android/quickstep/TaskAnimationManager;->notifyRecentsAnimationState(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 642
    .line 643
    .line 644
    invoke-virtual {v4, v6}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureStarted(Z)V

    .line 645
    .line 646
    .line 647
    invoke-virtual {v1, v0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 648
    .line 649
    .line 650
    invoke-virtual {v2, v0}, Lcom/android/quickstep/TaskAnimationManager;->notifyRecentsAnimationState(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 651
    .line 652
    .line 653
    goto :goto_9

    .line 654
    :cond_19
    new-instance v3, Landroid/content/Intent;

    .line 655
    .line 656
    invoke-virtual {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLaunchIntent()Landroid/content/Intent;

    .line 657
    .line 658
    .line 659
    move-result-object v5

    .line 660
    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 661
    .line 662
    .line 663
    const-string v5, "INTENT_EXTRA_LOG_TRACE_ID"

    .line 664
    .line 665
    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->getGestureId()I

    .line 666
    .line 667
    .line 668
    move-result v6

    .line 669
    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 670
    .line 671
    .line 672
    move-result-object v3

    .line 673
    const-string v5, "putExtra(...)"

    .line 674
    .line 675
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 676
    .line 677
    .line 678
    invoke-virtual {v2, v7, v3, v4}, Lcom/android/quickstep/TaskAnimationManager;->startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 679
    .line 680
    .line 681
    move-result-object v2

    .line 682
    const-string v3, "startRecentsAnimation(...)"

    .line 683
    .line 684
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v1, v2}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->setAnimationCallbacks(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 688
    .line 689
    .line 690
    invoke-virtual {v4, v15}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureStarted(Z)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {v1, v0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 694
    .line 695
    .line 696
    :goto_9
    const-string v0, "Transition:toOverview"

    .line 697
    .line 698
    invoke-static {v0, v15}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 699
    .line 700
    .line 701
    new-instance v0, Ljava/lang/StringBuilder;

    .line 702
    .line 703
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 704
    .line 705
    .line 706
    const-string v2, "switching via recents animation - onGestureStarted: "

    .line 707
    .line 708
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 709
    .line 710
    .line 711
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 712
    .line 713
    .line 714
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 715
    .line 716
    .line 717
    move-result-object v0

    .line 718
    invoke-static {v11, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    .line 720
    .line 721
    return v15
.end method

.method private static final executeWhenRecentsIsNotVisible$lambda$12(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;Lu4/a;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/OverviewCommandHelper;->onTransitionComplete(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;Lu4/a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final executeWhenRecentsIsVisible(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/views/RecentsView;Lu4/a;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/quickstep/OverviewCommandHelper$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    aget v0, v1, v0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_4

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eq v0, v2, :cond_2

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    if-eq v0, v2, :cond_2

    .line 21
    .line 22
    const/4 v2, 0x4

    .line 23
    if-eq v0, v2, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    if-ne v0, p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->startHome()V

    .line 29
    .line 30
    .line 31
    return v1

    .line 32
    :cond_0
    new-instance p0, Lh4/j;

    .line 33
    .line 34
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 35
    .line 36
    .line 37
    throw p0

    .line 38
    :cond_1
    invoke-direct {p0, p2}, Lcom/android/quickstep/OverviewCommandHelper;->getNextToggledTaskView(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0, p2, v0, p1, p3}, Lcom/android/quickstep/OverviewCommandHelper;->launchTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_2
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->isHandlingTouch()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    return v1

    .line 54
    :cond_3
    const/4 v0, -0x2

    .line 55
    iput v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p2, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-direct {p0, p2, v0, p1, p3}, Lcom/android/quickstep/OverviewCommandHelper;->launchTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_4
    return v1
.end method

.method public static synthetic f(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->processNextCommand$lambda$8$lambda$7(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final finishRecentsAnimation(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    instance-of p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-virtual {v0, p1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 29
    .line 30
    .line 31
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/OverviewCommandHelper;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand$lambda$1(Lcom/android/quickstep/OverviewCommandHelper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "**>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper;->overviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final getNextToggledTaskView(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;)",
            "Lcom/android/quickstep/views/TaskView;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getLastLargeTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    return-object p0

    .line 18
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->C()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getLargeTilesCount()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne p0, v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getLastLargeTaskView()Lcom/android/quickstep/views/TaskView;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-ne p0, v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getPreviousTaskView()Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    if-nez p0, :cond_2

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :cond_2
    return-object p0

    .line 55
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getNextTaskView()Lcom/android/quickstep/views/TaskView;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-nez p0, :cond_4

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    :cond_4
    return-object p0
.end method

.method private final getVisibleRecentsView(I)Lcom/android/quickstep/views/RecentsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getVisibleRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private final launchTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;",
            "Lcom/android/quickstep/views/TaskView;",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {}, Lx1/O;->T1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, -0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    invoke-static {}, Lx1/O;->Y2()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->y0()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string v5, "getContext(...)"

    .line 35
    .line 36
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v4}, Lcom/android/launcher3/P2$a;->a(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->e0:Z

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->getSmallMiniWindowTaskId(Landroid/content/Context;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz p2, :cond_1

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    move-object v4, v1

    .line 73
    :goto_0
    if-eqz v4, :cond_2

    .line 74
    .line 75
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object v4, v4, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 83
    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 94
    .line 95
    iget v2, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 96
    .line 97
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    .line 98
    .line 99
    invoke-static {p0, v2}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkTaskIdInSmallWindow(Landroid/content/Context;I)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    goto :goto_1

    .line 104
    :cond_3
    move v0, v2

    .line 105
    move p0, v3

    .line 106
    :goto_1
    const/4 v4, 0x1

    .line 107
    const-string v5, "OverviewCommandHelper"

    .line 108
    .line 109
    if-eqz p2, :cond_5

    .line 110
    .line 111
    if-eqz p0, :cond_4

    .line 112
    .line 113
    new-instance p0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string p2, "Launch task in small window mode, launch task id: "

    .line 119
    .line 120
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    invoke-virtual {p2, v4}, Lcom/android/quickstep/views/TaskView;->setEndQuickSwitchCuj(Z)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->launchWithAnimation()Lcom/android/launcher3/util/Y1;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    :cond_5
    :goto_2
    if-eqz v1, :cond_7

    .line 142
    .line 143
    new-instance p0, Lcom/android/quickstep/J1;

    .line 144
    .line 145
    invoke-direct {p0, p3, p4}, Lcom/android/quickstep/J1;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 149
    .line 150
    .line 151
    if-ltz v0, :cond_6

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/android/launcher3/util/Y1;->c()V

    .line 154
    .line 155
    .line 156
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    const-string p1, "launching task - waiting for callback: "

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    return v3

    .line 177
    :cond_7
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->startHome()V

    .line 178
    .line 179
    .line 180
    return v4
.end method

.method private static final launchTask$lambda$10(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launching task callback: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "OverviewCommandHelper"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private final logShowOverviewFrom(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/OverviewCommandHelper;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    aget p1, v0, p1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-eq p1, v0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    if-eq p1, v0, :cond_2

    .line 33
    .line 34
    const/4 v0, 0x4

    .line 35
    if-eq p1, v0, :cond_1

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_1
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->z3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->A3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->B3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 45
    .line 46
    :goto_1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 75
    .line 76
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private final onCommandFinished(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;->COMPLETED:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->setStatus(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 7
    .line 8
    invoke-static {v0}, Li4/m;->b0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "OverviewCommandHelper"

    .line 13
    .line 14
    if-eq v0, p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 17
    .line 18
    invoke-static {p0}, Li4/m;->b0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v2, "next task not scheduled. First pending command type is "

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p0, " - command type is: "

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v2, "command executed successfully! "

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;->remove(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Lcom/android/quickstep/OverviewCommandHelper;->processNextCommand()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private final onRecentsViewFocusUpdated(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/OverviewCommandHelper;->getVisibleRecentsView(I)Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v1, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->HIDE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 17
    .line 18
    if-ne p1, v1, :cond_2

    .line 19
    .line 20
    iget p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 21
    .line 22
    const/4 v1, -0x2

    .line 23
    if-ne p1, v1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setKeyboardTaskFocusIndex(I)V

    .line 27
    .line 28
    .line 29
    iget p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 32
    .line 33
    .line 34
    iput v1, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method private final onTransitionComplete(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;Lu4/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "switching via recents animation - onTransitionComplete: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "OverviewCommandHelper"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 24
    .line 25
    .line 26
    const-string p2, "Transition:toOverview"

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p2, v0}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->onRecentsViewFocusUpdated(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p3}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private final processNextCommand()V
    .locals 10

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const-string v0, "OverviewCommandHelper.processNextCommand"

    .line 8
    .line 9
    invoke-static {v0}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 13
    .line 14
    invoke-static {v0}, Li4/m;->b0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    const-string v2, "OverviewCommandHelper"

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    :try_start_1
    const-string p0, "no pending commands to be executed."

    .line 25
    .line 26
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p0, v0

    .line 33
    goto/16 :goto_1

    .line 34
    .line 35
    :cond_1
    sget-object v3, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;->PROCESSING:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->setStatus(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v4, "executing command: "

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/android/launcher3/y0;->K()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    iget-object v4, p0, Lcom/android/quickstep/OverviewCommandHelper;->coroutineScope:LF4/I;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->dispatcherProvider:Li2/b;

    .line 69
    .line 70
    invoke-interface {v2}, Li2/b;->b()LF4/E;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    new-instance v7, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-direct {v7, p0, v0, v2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)V

    .line 78
    .line 79
    .line 80
    const/4 v8, 0x2

    .line 81
    const/4 v9, 0x0

    .line 82
    const/4 v6, 0x0

    .line 83
    invoke-static/range {v4 .. v9}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    new-instance v3, Lcom/android/quickstep/H1;

    .line 88
    .line 89
    invoke-direct {v3, p0, v0}, Lcom/android/quickstep/H1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v0, v3}, Lcom/android/quickstep/OverviewCommandHelper;->executeCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    new-instance v4, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v5, "command executed: "

    .line 102
    .line 103
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v5, " with result: "

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    if-eqz v3, :cond_3

    .line 125
    .line 126
    invoke-direct {p0, v0}, Lcom/android/quickstep/OverviewCommandHelper;->onCommandFinished(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v3, "waiting for command callback: "

    .line 136
    .line 137
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    .line 152
    if-eqz v1, :cond_4

    .line 153
    .line 154
    invoke-static {}, LK0/a;->b()V

    .line 155
    .line 156
    .line 157
    :cond_4
    return-void

    .line 158
    :goto_1
    if-eqz v1, :cond_5

    .line 159
    .line 160
    invoke-static {}, LK0/a;->b()V

    .line 161
    .line 162
    .line 163
    :cond_5
    throw p0
.end method

.method private static final processNextCommand$lambda$8$lambda$7(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->onCommandFinished(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method

.method private final requestFocus(Landroid/view/View;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    new-instance p0, Lcom/android/quickstep/E1;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/android/quickstep/E1;-><init>(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method private static final requestFocus$lambda$14(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->requestAccessibilityFocus()Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final updateRecentsViewFocus(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/OverviewCommandHelper;->getVisibleRecentsView(I)Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->KEYBOARD_INPUT:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 17
    .line 18
    if-eq v1, v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->HIDE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 25
    .line 26
    if-eq v1, v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v1, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->SHOW:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 33
    .line 34
    if-eq p1, v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p1, v1}, Landroid/view/ViewRootImpl;->touchModeChanged(Z)V

    .line 43
    .line 44
    .line 45
    iget p1, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->requestFocus(Landroid/view/View;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getNextTaskView()Lcom/android/quickstep/views/TaskView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->requestFocus(Landroid/view/View;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->requestFocus(Landroid/view/View;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_2

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public final addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 7

    .line 1
    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand$default(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZILjava/lang/Object;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    move-result-object p0

    return-object p0
.end method

.method public final addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;I)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 7

    .line 2
    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-static/range {v1 .. v6}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand$default(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZILjava/lang/Object;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    move-result-object p0

    return-object p0
.end method

.method public final addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZ)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 13

    const-string v1, "type"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v1

    const/4 v3, 0x3

    const/4 v11, 0x0

    const-string v12, "OverviewCommandHelper"

    if-lt v1, v3, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "command not added: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " - queue is full ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v11

    .line 5
    :cond_0
    sget-boolean v1, Lcom/android/launcher3/W3;->A:Z

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->TOGGLE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    if-ne v1, p1, :cond_1

    .line 6
    const-string v0, "addCommand: springChainRunning return!"

    invoke-static {v12, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v11

    .line 7
    :cond_1
    new-instance v1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    const/16 v9, 0xe

    const/4 v10, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    move v7, p2

    move/from16 v8, p3

    invoke-direct/range {v1 .. v10}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZILkotlin/jvm/internal/j;)V

    .line 8
    iget-object v3, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentLinkedDeque;->add(Ljava/lang/Object;)Z

    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "command added: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    sget-object v3, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->TOGGLE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-ne v3, p1, :cond_2

    .line 11
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    invoke-virtual {v2}, Landroid/app/Service;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "MIPop_app_switch"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v5, :cond_2

    .line 12
    sget v2, Lcom/android/quickstep/OverviewCommandHelper;->mMiPopAppSwitchCount:I

    add-int/2addr v2, v5

    sput v2, Lcom/android/quickstep/OverviewCommandHelper;->mMiPopAppSwitchCount:I

    .line 13
    invoke-virtual {v1, v2}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->setMiPopAppSwitchSeq(I)V

    .line 14
    sget v2, Lcom/android/quickstep/OverviewCommandHelper;->mMiPopAppSwitchCount:I

    if-ne v2, v4, :cond_3

    .line 15
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->touchInteractionService:Lcom/android/quickstep/TouchInteractionService;

    invoke-virtual {v2}, Landroid/app/Service;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 16
    sput v6, Lcom/android/quickstep/OverviewCommandHelper;->mMiPopAppSwitchCount:I

    goto :goto_0

    .line 17
    :cond_2
    sput v6, Lcom/android/quickstep/OverviewCommandHelper;->mMiPopAppSwitchCount:I

    .line 18
    :cond_3
    :goto_0
    invoke-virtual {v1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/quickstep/OverviewCommandHelper;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    move-result-object v2

    .line 20
    sget-object v3, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    new-instance v6, Lcom/android/quickstep/F1;

    invoke-direct {v6, v2}, Lcom/android/quickstep/F1;-><init>(Lcom/android/launcher3/views/k;)V

    invoke-virtual {v3, v6}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 21
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v2

    const-string v6, " - queue size: "

    if-ne v2, v5, :cond_5

    .line 22
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "execute: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    invoke-static {}, Lcom/android/launcher3/y0;->K()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 24
    iget-object v4, p0, Lcom/android/quickstep/OverviewCommandHelper;->coroutineScope:LF4/I;

    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->dispatcherProvider:Li2/b;

    invoke-interface {v2}, Li2/b;->b()LF4/E;

    move-result-object v5

    new-instance v7, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;

    invoke-direct {v7, p0, v11}, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Ll4/d;)V

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    return-object v1

    .line 25
    :cond_4
    new-instance v2, Lcom/android/quickstep/G1;

    invoke-direct {v2, p0}, Lcom/android/quickstep/G1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;)V

    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    return-object v1

    .line 26
    :cond_5
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "not executed: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    iget-object v2, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v2

    if-le v2, v4, :cond_6

    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper;->clearPendingCommands()V

    :cond_6
    return-object v1
.end method

.method public final addCommandsForAllDisplays(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 3

    .line 1
    const-string v0, "type"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getActiveDisplayResources()Ljava/lang/Iterable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    invoke-static {v0, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getDisplayId()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v1}, Li4/m;->D0(Ljava/util/Collection;)[I

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/OverviewCommandHelper;->addCommandsForDisplays(Lcom/android/quickstep/OverviewCommandHelper$CommandType;[I)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public final addCommandsForDisplays(Lcom/android/quickstep/OverviewCommandHelper$CommandType;[I)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 8

    .line 1
    const-string v0, "type"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "displayIds"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    array-length v0, p2

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    array-length v0, p2

    .line 17
    const/4 v2, 0x0

    .line 18
    move v3, v2

    .line 19
    move v4, v3

    .line 20
    :goto_0
    if-ge v3, v0, :cond_2

    .line 21
    .line 22
    aget v1, p2, v3

    .line 23
    .line 24
    add-int/lit8 v5, v4, 0x1

    .line 25
    .line 26
    array-length v6, p2

    .line 27
    const/4 v7, 0x1

    .line 28
    sub-int/2addr v6, v7

    .line 29
    if-ne v4, v6, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v7, v2

    .line 33
    :goto_1
    invoke-virtual {p0, p1, v1, v7}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZ)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    move v4, v5

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return-object v1
.end method

.method public final addCommandsForDisplaysExcept(Lcom/android/quickstep/OverviewCommandHelper$CommandType;I)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 4

    .line 1
    const-string v0, "type"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->recentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getActiveDisplayResources()Ljava/lang/Iterable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    invoke-static {v0, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getDisplayId()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    move-object v3, v2

    .line 71
    check-cast v3, Ljava/lang/Number;

    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eq v3, p2, :cond_1

    .line 78
    .line 79
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-static {v0}, Li4/m;->D0(Ljava/util/Collection;)[I

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->addCommandsForDisplays(Lcom/android/quickstep/OverviewCommandHelper$CommandType;[I)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public final canStartHomeSafely()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 10
    .line 11
    invoke-static {p0}, Li4/m;->Z(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->HOME:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 22
    .line 23
    if-ne p0, v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public final clearPendingCommands()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "clearing pending commands: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "OverviewCommandHelper"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 26
    .line 27
    new-instance v0, Lcom/android/quickstep/K1;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/android/quickstep/K1;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, v0}, Li4/m;->B(Ljava/lang/Iterable;Lu4/l;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final dump(Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "pw"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "OverviewCommandHelper:"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "  pendingCommands="

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 46
    .line 47
    invoke-static {v0}, Li4/m;->Z(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v2, "    pendingCommandType="

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget p0, p0, Lcom/android/quickstep/OverviewCommandHelper;->keyboardTaskFocusIndex:I

    .line 78
    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v1, "  keyboardTaskFocusIndex="

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final executeCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "command"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onCallbackResult"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->getDisplayId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-direct {p0, v0}, Lcom/android/quickstep/OverviewCommandHelper;->getVisibleRecentsView(I)Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "executeCommand: "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, " - visibleRecentsView: "

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "OverviewCommandHelper"

    .line 45
    .line 46
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-direct {p0, p1, v0, p2}, Lcom/android/quickstep/OverviewCommandHelper;->executeWhenRecentsIsVisible(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/views/RecentsView;Lu4/a;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->executeWhenRecentsIsNotVisible(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method
