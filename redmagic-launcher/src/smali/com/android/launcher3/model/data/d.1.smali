.class public Lcom/android/launcher3/model/data/d;
.super Lcom/android/launcher3/model/data/z;
.source "AppInfo.java"

# interfaces
.implements Lcom/android/launcher3/model/data/F;


# static fields
.field public static final o:[Lcom/android/launcher3/model/data/d;

.field public static final p:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field

.field public static final q:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public k:Landroid/content/Intent;

.field public l:Landroid/content/ComponentName;

.field public m:Ljava/lang/String;

.field public n:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lcom/android/launcher3/model/data/d;

    .line 3
    .line 4
    sput-object v0, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/model/data/a;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/android/launcher3/model/data/a;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/model/data/d;->p:Ljava/util/Comparator;

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/model/data/b;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/android/launcher3/model/data/b;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lcom/android/launcher3/model/data/c;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/android/launcher3/model/data/c;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/Comparator;->thenComparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/android/launcher3/model/data/d;->q:Ljava/util/Comparator;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 2
    const-string v0, ""

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lcom/android/launcher3/model/data/d;->n:I

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    return-void
.end method

.method public constructor <init>(LD1/f;)V
    .locals 2

    .line 33
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 34
    const-string v0, ""

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    const/4 v0, -0x1

    .line 35
    iput v0, p0, Lcom/android/launcher3/model/data/d;->n:I

    .line 36
    iget-object v0, p1, LD1/f;->a:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 37
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.LAUNCHER"

    .line 38
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x10200000

    .line 40
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 41
    invoke-virtual {p0, p1}, Lcom/android/launcher3/model/data/z;->K(LD1/f;)V

    .line 42
    iget-object p1, p1, LD1/f;->e:Landroid/os/UserHandle;

    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    return-void
.end method

.method public constructor <init>(Landroid/content/ComponentName;Ljava/lang/CharSequence;Landroid/os/UserHandle;Landroid/content/Intent;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    const/4 v0, -0x1

    .line 28
    iput v0, p0, Lcom/android/launcher3/model/data/d;->n:I

    .line 29
    iput-object p1, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 30
    iput-object p2, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 31
    iput-object p3, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 32
    iput-object p4, p0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V
    .locals 7

    .line 5
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/t;

    invoke-virtual {v0, p3}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    move-result-object v3

    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 6
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/android/launcher3/util/f;

    sget-object v0, Lcom/android/launcher3/util/J1;->d:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/android/launcher3/util/J1;

    const-class v0, Landroid/os/UserManager;

    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/UserManager;

    invoke-virtual {p1, p3}, Landroid/os/UserManager;->isQuietModeEnabled(Landroid/os/UserHandle;)Z

    move-result v6

    move-object v1, p0

    move-object v2, p2

    .line 8
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;Z)V
    .locals 1

    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lcom/android/launcher3/model/data/d;->n:I

    .line 12
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    const/16 v0, -0x68

    .line 13
    iput v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 14
    iget-object v0, p2, Lcom/android/launcher3/util/N2;->a:Landroid/os/UserHandle;

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 15
    invoke-static {p1}, Lcom/android/launcher3/model/data/d;->R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    if-eqz p5, :cond_0

    .line 16
    iget p5, p0, Lcom/android/launcher3/model/data/z;->h:I

    or-int/lit8 p5, p5, 0x8

    iput p5, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p5

    iget p5, p5, Landroid/content/pm/ApplicationInfo;->uid:I

    iput p5, p0, Lcom/android/launcher3/model/data/d;->n:I

    .line 18
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/model/data/d;->T(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;)Z

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/d;)V
    .locals 2

    .line 19
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/z;-><init>(Lcom/android/launcher3/model/data/z;)V

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    const/4 v0, -0x1

    .line 21
    iput v0, p0, Lcom/android/launcher3/model/data/d;->n:I

    .line 22
    iget-object v0, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 23
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    invoke-static {v0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 24
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 25
    iget p1, p1, Lcom/android/launcher3/model/data/d;->n:I

    iput p1, p0, Lcom/android/launcher3/model/data/d;->n:I

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/UserHandle;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/os/UserHandle;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->compareTo(Landroid/content/ComponentName;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public static synthetic O(Lcom/android/launcher3/model/data/d;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/os/UserHandle;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static Q(Landroid/content/ComponentName;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.MAIN"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "android.intent.category.LAUNCHER"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/high16 v0, 0x10200000

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/model/data/d;->Q(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static T(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->y()I

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/util/k;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/pm/ApplicationInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->m()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 23
    .line 24
    or-int/lit8 v2, v2, 0x4

    .line 25
    .line 26
    iput v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 30
    .line 31
    and-int/lit8 v2, v2, -0x5

    .line 32
    .line 33
    iput v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 34
    .line 35
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-boolean v2, v2, Landroid/content/pm/ActivityInfo;->isArchived:Z

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 50
    .line 51
    or-int/lit16 v2, v2, 0x4000

    .line 52
    .line 53
    iput v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 57
    .line 58
    and-int/lit16 v2, v2, -0x4001

    .line 59
    .line 60
    iput v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 61
    .line 62
    :cond_2
    :goto_1
    iget v2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->n()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    const/16 v1, 0x40

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    const/16 v1, 0x80

    .line 74
    .line 75
    :goto_2
    or-int/2addr v1, v2

    .line 76
    iput v1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 77
    .line 78
    invoke-static {}, Lcom/android/launcher3/y0;->x0()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    invoke-virtual {p2}, Lcom/android/launcher3/util/N2;->d()Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_4

    .line 89
    .line 90
    iget p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 91
    .line 92
    or-int/lit16 p2, p2, 0x2000

    .line 93
    .line 94
    iput p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    iget p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 98
    .line 99
    and-int/lit16 p2, p2, -0x2001

    .line 100
    .line 101
    iput p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 102
    .line 103
    :cond_5
    :goto_3
    invoke-static {p1}, Lcom/android/launcher3/util/J1;->f(Landroid/content/pm/LauncherActivityInfo;)I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    const/4 v1, 0x2

    .line 108
    invoke-virtual {p0, p2, v1}, Lcom/android/launcher3/model/data/z;->J(II)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/f;->l(Landroid/content/pm/LauncherActivityInfo;)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    invoke-virtual {p0, p2}, Lcom/android/launcher3/model/data/z;->I(Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/f;->n(Landroid/content/pm/LauncherActivityInfo;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    invoke-virtual {p0, p1}, Lcom/android/launcher3/model/data/z;->L(Z)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->y()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-ne p4, p1, :cond_7

    .line 130
    .line 131
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 132
    .line 133
    if-eq v0, p0, :cond_6

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_6
    const/4 p0, 0x0

    .line 137
    return p0

    .line 138
    :cond_7
    :goto_4
    const/4 p0, 0x1

    .line 139
    return p0
.end method


# virtual methods
.method public P()Lcom/android/launcher3/model/data/d;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/model/data/d;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S()Lcom/android/launcher3/util/E;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;
    .locals 1

    .line 1
    new-instance p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 7
    .line 8
    and-int/lit16 v0, p0, 0x400

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget v0, p1, Lcom/android/launcher3/model/data/I;->m:I

    .line 13
    .line 14
    or-int/lit16 v0, v0, 0x406

    .line 15
    .line 16
    iput v0, p1, Lcom/android/launcher3/model/data/I;->m:I

    .line 17
    .line 18
    :cond_0
    and-int/lit16 p0, p0, 0x800

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    iget p0, p1, Lcom/android/launcher3/model/data/z;->h:I

    .line 23
    .line 24
    or-int/lit16 p0, p0, 0x800

    .line 25
    .line 26
    iput p0, p1, Lcom/android/launcher3/model/data/z;->h:I

    .line 27
    .line 28
    :cond_1
    return-object p1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/d;->P()Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/android/launcher3/model/data/z;->dumpProperties()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " componentName="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTargetComponent()Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic v()Lcom/android/launcher3/model/data/z;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/d;->P()Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
