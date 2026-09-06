.class public final Lcom/android/launcher3/taskbar/q3;
.super Ljava/lang/Object;
.source "TaskbarPinningController.kt"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/q3$a;
    }
.end annotation


# static fields
.field public static final n:Lcom/android/launcher3/taskbar/q3$a;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private h:Lcom/android/launcher3/taskbar/R1;

.field private i:Lcom/android/launcher3/taskbar/J3;

.field private j:Lcom/android/launcher3/J3;

.field private final k:Lcom/android/launcher3/logging/StatsLogManager;

.field private l:Z

.field public m:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/q3$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/q3$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/q3;->n:Lcom/android/launcher3/taskbar/q3$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/q3;Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/q3;->o(Lcom/android/launcher3/taskbar/q3;Landroid/view/View;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/q3;Z)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/q3;->j(Lcom/android/launcher3/taskbar/q3;Z)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/q3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/q3;->k(Lcom/android/launcher3/taskbar/q3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final j(Lcom/android/launcher3/taskbar/q3;Z)Lh4/t;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->b3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Lcom/android/launcher3/taskbar/o3;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/o3;-><init>(Lcom/android/launcher3/taskbar/q3;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 24
    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    const-string p1, "controllers"

    .line 37
    .line 38
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    move-object p1, v0

    .line 42
    :cond_1
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v1}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v1, 0x0

    .line 55
    const-string v2, "launcherPrefs"

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    move-object p1, v0

    .line 67
    :cond_2
    sget-object v2, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_5

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 83
    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    move-object p1, v0

    .line 90
    :cond_4
    sget-object v2, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_5

    .line 103
    .line 104
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/q3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->c3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 111
    .line 112
    invoke-interface {p1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 113
    .line 114
    .line 115
    const/high16 p1, 0x3f800000    # 1.0f

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/q3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->d3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 125
    .line 126
    invoke-interface {p1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 127
    .line 128
    .line 129
    move p1, v1

    .line 130
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/q3;->i:Lcom/android/launcher3/taskbar/J3;

    .line 131
    .line 132
    if-nez v2, :cond_6

    .line 133
    .line 134
    const-string v2, "taskbarSharedState"

    .line 135
    .line 136
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_6
    move-object v0, v2

    .line 141
    :goto_2
    cmpg-float v1, p1, v1

    .line 142
    .line 143
    if-nez v1, :cond_7

    .line 144
    .line 145
    const/4 v1, 0x1

    .line 146
    goto :goto_3

    .line 147
    :cond_7
    const/4 v1, 0x0

    .line 148
    :goto_3
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/J3;->c(Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/q3;->e(F)V

    .line 152
    .line 153
    .line 154
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 155
    .line 156
    return-object p0
.end method

.method private static final k(Lcom/android/launcher3/taskbar/q3;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->i(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private static final o(Lcom/android/launcher3/taskbar/q3;Landroid/view/View;F)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/q3;->h(Landroid/view/View;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/q3;->g()Lu4/l;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->setOnCloseCallback(Lu4/l;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Lcom/android/launcher3/taskbar/I1;->i(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/popup/c;->show()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->a3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private final p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/q3;->l:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->setAnimatingTaskbarPinning(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 5

    .line 1
    const-string v0, "prefix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pw"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "TaskbarPinningController:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/q3;->l:Z

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "\tisAnimatingTaskbarPinning="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    const-string v2, "launcherPrefs"

    .line 60
    .line 61
    if-nez v0, :cond_0

    .line 62
    .line 63
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    move-object v0, v1

    .line 67
    :cond_0
    sget-object v3, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    .line 68
    .line 69
    invoke-virtual {v0, v3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v3, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v4, "\tTASKBAR_PINNING shared pref ="

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 97
    .line 98
    if-nez p0, :cond_1

    .line 99
    .line 100
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    move-object v1, p0

    .line 105
    :goto_0
    sget-object p0, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    .line 106
    .line 107
    invoke-virtual {v1, p0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string p1, "\tTASKBAR_PINNING_IN_DESKTOP_MODE shared pref in desktop mode ="

    .line 120
    .line 121
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final e(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "controllers"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/q3;->f(F)Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v3, Lcom/android/launcher3/taskbar/q3$b;

    .line 19
    .line 20
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/q3$b;-><init>(Lcom/android/launcher3/taskbar/q3;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v3, 0x258

    .line 27
    .line 28
    invoke-virtual {p1, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 32
    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move-object v1, v3

    .line 40
    :goto_0
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 41
    .line 42
    invoke-virtual {v1}, La2/e;->m()V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/q3;->p(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/W4;->y()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final f(F)Landroid/animation/AnimatorSet;
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v3, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    const-string v5, "controllers"

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object v3, v4

    .line 19
    :cond_0
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 20
    .line 21
    iget-object v6, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 22
    .line 23
    if-nez v6, :cond_1

    .line 24
    .line 25
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object v6, v4

    .line 29
    :cond_1
    iget-object v6, v6, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 30
    .line 31
    invoke-virtual {v6}, Lcom/android/launcher3/taskbar/s2;->v()Lcom/android/launcher3/anim/d;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {v6, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/W4;->W()Lcom/android/launcher3/anim/d;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-virtual {v7, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/W4;->T()Lcom/android/launcher3/anim/d;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    invoke-virtual {v8, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/W4;->V()Lcom/android/launcher3/anim/d;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const/4 v9, 0x4

    .line 64
    new-array v9, v9, [Landroid/animation/Animator;

    .line 65
    .line 66
    aput-object v6, v9, v1

    .line 67
    .line 68
    aput-object v7, v9, v0

    .line 69
    .line 70
    const/4 v6, 0x2

    .line 71
    aput-object v8, v9, v6

    .line 72
    .line 73
    const/4 v6, 0x3

    .line 74
    aput-object v3, v9, v6

    .line 75
    .line 76
    invoke-virtual {v2, v9}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 80
    .line 81
    if-nez p0, :cond_2

    .line 82
    .line 83
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    move-object v4, p0

    .line 88
    :goto_0
    iget-object p0, v4, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 89
    .line 90
    const-string v3, "bubbleControllers"

    .line 91
    .line 92
    invoke-static {p0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p0}, Lw4/a;->a(Ljava/util/Optional;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 100
    .line 101
    if-eqz p0, :cond_3

    .line 102
    .line 103
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 104
    .line 105
    if-eqz p0, :cond_3

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_3

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->g0()Lcom/android/launcher3/anim/d;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    new-array p1, v0, [Landroid/animation/Animator;

    .line 122
    .line 123
    aput-object p0, p1, v1

    .line 124
    .line 125
    invoke-virtual {v2, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 126
    .line 127
    .line 128
    :cond_3
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 129
    .line 130
    invoke-virtual {v2, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 131
    .line 132
    .line 133
    return-object v2
.end method

.method public final g()Lu4/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lu4/l<",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->m:Lu4/l;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "onCloseCallback"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final h(Landroid/view/View;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "F)",
            "Lcom/android/launcher3/taskbar/TaskbarDividerPopupView<",
            "*>;"
        }
    .end annotation

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->s:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {v0, p1, p0, p2}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;->a(Landroid/view/View;Lcom/android/launcher3/taskbar/I1;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final i(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/J3;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "VisibleForTests"
        }
    .end annotation

    .line 1
    const-string v0, "taskbarControllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "sharedState"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/taskbar/q3;->i:Lcom/android/launcher3/taskbar/J3;

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->x0()Lcom/android/launcher3/J3;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 22
    .line 23
    new-instance p1, Lcom/android/launcher3/taskbar/n3;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/n3;-><init>(Lcom/android/launcher3/taskbar/q3;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/q3;->m(Lu4/l;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/q3;->p(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "controllers"

    .line 11
    .line 12
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    move-object v0, v1

    .line 16
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v2, "launcherPrefs"

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    move-object v0, v1

    .line 40
    :cond_1
    sget-object v3, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 43
    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move-object v1, p0

    .line 51
    :goto_0
    invoke-virtual {v1, v3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    xor-int/lit8 p0, p0, 0x1

    .line 62
    .line 63
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, v3, p0}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 72
    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    move-object v0, v1

    .line 79
    :cond_4
    sget-object v3, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q3;->j:Lcom/android/launcher3/J3;

    .line 82
    .line 83
    if-nez p0, :cond_5

    .line 84
    .line 85
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_5
    move-object v1, p0

    .line 90
    :goto_1
    invoke-virtual {v1, v3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    xor-int/lit8 p0, p0, 0x1

    .line 101
    .line 102
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, v3, p0}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final m(Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q3;->m:Lu4/l;

    .line 7
    .line 8
    return-void
.end method

.method public final n(Landroid/view/View;F)V
    .locals 2

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/taskbar/p3;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/taskbar/p3;-><init>(Lcom/android/launcher3/taskbar/q3;Landroid/view/View;F)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
