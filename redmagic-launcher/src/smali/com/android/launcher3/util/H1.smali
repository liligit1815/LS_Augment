.class public final Lcom/android/launcher3/util/H1;
.super Ljava/lang/Object;
.source "OnboardingPrefs.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/H1$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/util/H1;

.field public static final b:Lcom/android/launcher3/util/H1$a;

.field public static final c:Lcom/android/launcher3/util/H1$a;

.field public static final d:Lcom/android/launcher3/util/H1$a;

.field public static final e:Lcom/android/launcher3/util/H1$a;

.field public static final f:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final g:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/android/launcher3/util/H1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/H1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/H1;->a:Lcom/android/launcher3/util/H1;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/util/H1$a;

    .line 9
    .line 10
    const-string v1, "launcher.taskbar_edu_tooltip_step"

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/H1$a;-><init>(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/android/launcher3/util/H1;->b:Lcom/android/launcher3/util/H1$a;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/util/H1$a;

    .line 19
    .line 20
    const-string v1, "launcher.home_bounce_count"

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/H1$a;-><init>(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/android/launcher3/util/H1;->c:Lcom/android/launcher3/util/H1$a;

    .line 26
    .line 27
    new-instance v0, Lcom/android/launcher3/util/H1$a;

    .line 28
    .line 29
    const-string v1, "launcher.hotseat_discovery_tip_count"

    .line 30
    .line 31
    const/4 v2, 0x5

    .line 32
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/H1$a;-><init>(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/util/H1;->d:Lcom/android/launcher3/util/H1$a;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/util/H1$a;

    .line 38
    .line 39
    const-string v1, "launcher.all_apps_visited_count"

    .line 40
    .line 41
    const/16 v2, 0x14

    .line 42
    .line 43
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/H1$a;-><init>(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    .line 47
    .line 48
    sget-object v3, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 49
    .line 50
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 51
    .line 52
    const/4 v7, 0x4

    .line 53
    const/4 v8, 0x0

    .line 54
    const-string v4, "launcher.apps_view_shown"

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/J3$a;->c(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;ILjava/lang/Object;)Lcom/android/launcher3/X;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lcom/android/launcher3/util/H1;->f:Lcom/android/launcher3/X;

    .line 62
    .line 63
    const-string v4, "launcher.hotseat_longpress_tip_seen"

    .line 64
    .line 65
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/J3$a;->c(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;ILjava/lang/Object;)Lcom/android/launcher3/X;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, Lcom/android/launcher3/util/H1;->g:Lcom/android/launcher3/X;

    .line 70
    .line 71
    const-string v4, "launcher.taskbar_search_edu_seen"

    .line 72
    .line 73
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/J3$a;->c(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;ILjava/lang/Object;)Lcom/android/launcher3/X;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sput-object v0, Lcom/android/launcher3/util/H1;->h:Lcom/android/launcher3/X;

    .line 78
    .line 79
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
