.class public interface abstract Lcom/android/quickstep/TaskShortcutFactory;
.super Ljava/lang/Object;
.source "TaskShortcutFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/TaskShortcutFactory$MiniWindowSystemShortcut;,
        Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;,
        Lcom/android/quickstep/TaskShortcutFactory$PinSystemShortcut;,
        Lcom/android/quickstep/TaskShortcutFactory$CloseSystemShortcut;,
        Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;,
        Lcom/android/quickstep/TaskShortcutFactory$SaveAppPairSystemShortcut;,
        Lcom/android/quickstep/TaskShortcutFactory$SplitSelectSystemShortcut;
    }
.end annotation


# static fields
.field public static final APP_INFO:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final CLOSE:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final FREE_FORM:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final INSTALL:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final LOCK_APP:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final MINI_WINDOW:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final MODAL:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final PIN:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final SAVE_APP_PAIR:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final SCREENSHOT:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final SHARE:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final SPLIT_SELECT:Lcom/android/quickstep/TaskShortcutFactory;

.field public static final WELLBEING:Lcom/android/quickstep/TaskShortcutFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->APP_INFO:Lcom/android/quickstep/TaskShortcutFactory;

    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->SPLIT_SELECT:Lcom/android/quickstep/TaskShortcutFactory;

    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$3;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$3;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->SAVE_APP_PAIR:Lcom/android/quickstep/TaskShortcutFactory;

    .line 21
    .line 22
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$4;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$4;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->FREE_FORM:Lcom/android/quickstep/TaskShortcutFactory;

    .line 28
    .line 29
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$5;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$5;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->PIN:Lcom/android/quickstep/TaskShortcutFactory;

    .line 35
    .line 36
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$6;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$6;-><init>()V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->INSTALL:Lcom/android/quickstep/TaskShortcutFactory;

    .line 42
    .line 43
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$7;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$7;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->WELLBEING:Lcom/android/quickstep/TaskShortcutFactory;

    .line 49
    .line 50
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$8;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$8;-><init>()V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->SCREENSHOT:Lcom/android/quickstep/TaskShortcutFactory;

    .line 56
    .line 57
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$9;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$9;-><init>()V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->MODAL:Lcom/android/quickstep/TaskShortcutFactory;

    .line 63
    .line 64
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$10;

    .line 65
    .line 66
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$10;-><init>()V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->CLOSE:Lcom/android/quickstep/TaskShortcutFactory;

    .line 70
    .line 71
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$11;

    .line 72
    .line 73
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$11;-><init>()V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->LOCK_APP:Lcom/android/quickstep/TaskShortcutFactory;

    .line 77
    .line 78
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$12;

    .line 79
    .line 80
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$12;-><init>()V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->SHARE:Lcom/android/quickstep/TaskShortcutFactory;

    .line 84
    .line 85
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$13;

    .line 86
    .line 87
    invoke-direct {v0}, Lcom/android/quickstep/TaskShortcutFactory$13;-><init>()V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/android/quickstep/TaskShortcutFactory;->MINI_WINDOW:Lcom/android/quickstep/TaskShortcutFactory;

    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public createSingletonShortcutList(Lcom/android/launcher3/popup/P;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/popup/P;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            "Lcom/android/quickstep/views/TaskContainer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public showForDesktopTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public showForGroupedTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
