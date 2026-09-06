.class Lz1/w4$b;
.super Ljava/lang/Object;
.source "QuickstepModelDelegate.java"

# interfaces
.implements Lcom/android/launcher3/util/R1$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/w4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/util/R1$a<",
        "Lcom/android/launcher3/model/data/y;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lz1/L4;

.field private final c:Lcom/android/launcher3/util/J1;

.field private final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final e:I

.field private final f:I

.field private final g:Lt1/g;

.field private h:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lz1/L4;Lcom/android/launcher3/util/J1;Ljava/util/Map;IILt1/g;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lz1/L4;",
            "Lcom/android/launcher3/util/J1;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;II",
            "Lt1/g;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lz1/w4$b;->h:I

    .line 6
    .line 7
    iput-object p1, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Lz1/w4$b;->b:Lz1/L4;

    .line 10
    .line 11
    iput-object p3, p0, Lz1/w4$b;->c:Lcom/android/launcher3/util/J1;

    .line 12
    .line 13
    iput-object p4, p0, Lz1/w4$b;->d:Ljava/util/Map;

    .line 14
    .line 15
    iput p5, p0, Lz1/w4$b;->e:I

    .line 16
    .line 17
    iput p6, p0, Lz1/w4$b;->f:I

    .line 18
    .line 19
    iput-object p7, p0, Lz1/w4$b;->g:Lt1/g;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(ILandroid/os/UserHandle;Landroid/content/Intent;)Lcom/android/launcher3/model/data/y;
    .locals 9

    .line 1
    iget v0, p0, Lz1/w4$b;->h:I

    .line 2
    .line 3
    iget v1, p0, Lz1/w4$b;->e:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    return-object v2

    .line 9
    :cond_0
    if-eqz p1, :cond_4

    .line 10
    .line 11
    const/4 v0, 0x6

    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    return-object v2

    .line 15
    :cond_1
    invoke-static {p3, p2}, LN1/e;->c(Landroid/content/Intent;Landroid/os/UserHandle;)LN1/e;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    return-object v2

    .line 22
    :cond_2
    iget-object p2, p0, Lz1/w4$b;->d:Ljava/util/Map;

    .line 23
    .line 24
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/content/pm/ShortcutInfo;

    .line 29
    .line 30
    if-nez p1, :cond_3

    .line 31
    .line 32
    return-object v2

    .line 33
    :cond_3
    new-instance p2, Lcom/android/launcher3/model/data/I;

    .line 34
    .line 35
    iget-object p3, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 36
    .line 37
    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    iget p3, p0, Lz1/w4$b;->f:I

    .line 41
    .line 42
    iput p3, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 43
    .line 44
    iget-object p3, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-virtual {p3, p2, p1}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 55
    .line 56
    .line 57
    iget p1, p0, Lz1/w4$b;->h:I

    .line 58
    .line 59
    add-int/lit8 p1, p1, 0x1

    .line 60
    .line 61
    iput p1, p0, Lz1/w4$b;->h:I

    .line 62
    .line 63
    return-object p2

    .line 64
    :cond_4
    iget-object p1, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 65
    .line 66
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 73
    .line 74
    invoke-virtual {p1, p3, p2}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    if-nez v4, :cond_5

    .line 79
    .line 80
    return-object v2

    .line 81
    :cond_5
    new-instance v3, Lcom/android/launcher3/model/data/d;

    .line 82
    .line 83
    sget-object p1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 84
    .line 85
    iget-object p3, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 86
    .line 87
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, LD1/t;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    sget-object p1, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 98
    .line 99
    iget-object p3, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 100
    .line 101
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    move-object v6, p1

    .line 106
    check-cast v6, Lcom/android/launcher3/util/f;

    .line 107
    .line 108
    iget-object v7, p0, Lz1/w4$b;->c:Lcom/android/launcher3/util/J1;

    .line 109
    .line 110
    iget-object p1, p0, Lz1/w4$b;->b:Lz1/L4;

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Lz1/L4;->d(Landroid/os/UserHandle;)Z

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;Z)V

    .line 117
    .line 118
    .line 119
    iget p1, p0, Lz1/w4$b;->f:I

    .line 120
    .line 121
    iput p1, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 122
    .line 123
    iget-object p1, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 124
    .line 125
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object p2, p0, Lz1/w4$b;->g:Lt1/g;

    .line 134
    .line 135
    invoke-virtual {p1, v3, v4, p2}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 136
    .line 137
    .line 138
    iget p1, p0, Lz1/w4$b;->h:I

    .line 139
    .line 140
    add-int/lit8 p1, p1, 0x1

    .line 141
    .line 142
    iput p1, p0, Lz1/w4$b;->h:I

    .line 143
    .line 144
    iget-object p0, p0, Lz1/w4$b;->a:Landroid/content/Context;

    .line 145
    .line 146
    invoke-virtual {v3, p0}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0
.end method
