.class public abstract Lt1/f;
.super Ljava/lang/Object;
.source "BaseIconCache.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lt1/f$a;,
        Lt1/f$b;,
        Lt1/f$c;
    }
.end annotation


# static fields
.field public static final A:[Ljava/lang/String;

.field public static final B:[Ljava/lang/String;

.field public static final C:I

.field public static final D:I

.field public static final E:I

.field public static final F:I

.field public static final G:I

.field public static final H:I

.field public static final o:Lt1/f$b;

.field public static final p:I

.field public static final q:Ljava/lang/String;

.field public static final r:Ljava/lang/String;

.field public static final s:Ljava/lang/String;

.field public static final t:Ljava/lang/String;

.field public static final u:Ljava/lang/String;

.field public static final v:Ljava/lang/String;

.field public static final w:Ljava/lang/String;

.field public static final x:Ljava/lang/String;

.field public static final y:Ljava/lang/String;

.field public static final z:Ljava/lang/String;


# instance fields
.field protected final a:Landroid/content/Context;

.field private final b:Ljava/lang/String;

.field private final c:Landroid/os/Looper;

.field private d:I

.field private final e:Ls1/T;

.field private final f:Landroid/content/pm/PackageManager;

.field private final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Ljava/lang/Object;

.field public final i:Landroid/os/Handler;

.field protected j:Lt1/f$c;

.field private k:Ls1/d;

.field private final l:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/util/p0;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final n:Lt1/a;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lt1/f$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lt1/f$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lt1/f;->o:Lt1/f$b;

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->k0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/16 v0, 0xa

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v0, 0x9

    .line 19
    .line 20
    :goto_0
    sput v0, Lt1/f;->p:I

    .line 21
    .line 22
    const-string v0, "icons"

    .line 23
    .line 24
    sput-object v0, Lt1/f;->q:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "rowid"

    .line 27
    .line 28
    sput-object v0, Lt1/f;->r:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "componentName"

    .line 31
    .line 32
    sput-object v0, Lt1/f;->s:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "profileId"

    .line 35
    .line 36
    sput-object v1, Lt1/f;->t:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "freshnessId"

    .line 39
    .line 40
    sput-object v1, Lt1/f;->u:Ljava/lang/String;

    .line 41
    .line 42
    const-string v2, "icon"

    .line 43
    .line 44
    sput-object v2, Lt1/f;->v:Ljava/lang/String;

    .line 45
    .line 46
    const-string v3, "icon_color"

    .line 47
    .line 48
    sput-object v3, Lt1/f;->w:Ljava/lang/String;

    .line 49
    .line 50
    const-string v4, "mono_icon"

    .line 51
    .line 52
    sput-object v4, Lt1/f;->x:Ljava/lang/String;

    .line 53
    .line 54
    const-string v5, "flags"

    .line 55
    .line 56
    sput-object v5, Lt1/f;->y:Ljava/lang/String;

    .line 57
    .line 58
    const-string v6, "label"

    .line 59
    .line 60
    sput-object v6, Lt1/f;->z:Ljava/lang/String;

    .line 61
    .line 62
    filled-new-array {v0, v6, v3, v5}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lt1/f;->A:[Ljava/lang/String;

    .line 67
    .line 68
    array-length v7, v0

    .line 69
    add-int/lit8 v7, v7, 0x3

    .line 70
    .line 71
    invoke-static {v0, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v7, "copyOf(...)"

    .line 76
    .line 77
    invoke-static {v0, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    check-cast v0, [Ljava/lang/String;

    .line 81
    .line 82
    array-length v7, v0

    .line 83
    add-int/lit8 v7, v7, -0x3

    .line 84
    .line 85
    aput-object v2, v0, v7

    .line 86
    .line 87
    array-length v7, v0

    .line 88
    add-int/lit8 v7, v7, -0x2

    .line 89
    .line 90
    aput-object v4, v0, v7

    .line 91
    .line 92
    array-length v7, v0

    .line 93
    add-int/lit8 v7, v7, -0x1

    .line 94
    .line 95
    aput-object v1, v0, v7

    .line 96
    .line 97
    sput-object v0, Lt1/f;->B:[Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0, v6}, Li4/g;->P([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    sput v6, Lt1/f;->C:I

    .line 104
    .line 105
    invoke-static {v0, v3}, Li4/g;->P([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    sput v3, Lt1/f;->D:I

    .line 110
    .line 111
    invoke-static {v0, v5}, Li4/g;->P([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    sput v3, Lt1/f;->E:I

    .line 116
    .line 117
    invoke-static {v0, v2}, Li4/g;->P([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    sput v2, Lt1/f;->F:I

    .line 122
    .line 123
    invoke-static {v0, v4}, Li4/g;->P([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    sput v2, Lt1/f;->G:I

    .line 128
    .line 129
    invoke-static {v0, v1}, Li4/g;->P([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    sput v0, Lt1/f;->H:I

    .line 134
    .line 135
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;IIZLs1/T;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bgLooper"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "iconProvider"

    .line 12
    .line 13
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lt1/f;->a:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, Lt1/f;->b:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p3, p0, Lt1/f;->c:Landroid/os/Looper;

    .line 24
    .line 25
    iput p4, p0, Lt1/f;->d:I

    .line 26
    .line 27
    iput-object p7, p0, Lt1/f;->e:Ls1/T;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    const-string p7, "getPackageManager(...)"

    .line 34
    .line 35
    invoke-static {p4, p7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput-object p4, p0, Lt1/f;->f:Landroid/content/pm/PackageManager;

    .line 39
    .line 40
    if-eqz p6, :cond_0

    .line 41
    .line 42
    new-instance p4, Ljava/util/HashMap;

    .line 43
    .line 44
    const/16 p6, 0x32

    .line 45
    .line 46
    invoke-direct {p4, p6}, Ljava/util/HashMap;-><init>(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    new-instance p4, Lt1/f$f;

    .line 51
    .line 52
    invoke-direct {p4}, Lt1/f$f;-><init>()V

    .line 53
    .line 54
    .line 55
    :goto_0
    iput-object p4, p0, Lt1/f;->g:Ljava/util/Map;

    .line 56
    .line 57
    new-instance p4, Ljava/lang/Object;

    .line 58
    .line 59
    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object p4, p0, Lt1/f;->h:Ljava/lang/Object;

    .line 63
    .line 64
    new-instance p4, Landroid/os/Handler;

    .line 65
    .line 66
    invoke-direct {p4, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 67
    .line 68
    .line 69
    iput-object p4, p0, Lt1/f;->i:Landroid/os/Handler;

    .line 70
    .line 71
    new-instance p3, Lt1/f$c;

    .line 72
    .line 73
    invoke-direct {p3, p1, p2, p5}, Lt1/f$c;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    iput-object p3, p0, Lt1/f;->j:Lt1/f$c;

    .line 77
    .line 78
    new-instance p2, Landroid/util/SparseArray;

    .line 79
    .line 80
    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object p2, p0, Lt1/f;->l:Landroid/util/SparseArray;

    .line 84
    .line 85
    new-instance p2, Landroid/util/SparseArray;

    .line 86
    .line 87
    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object p2, p0, Lt1/f;->m:Landroid/util/SparseArray;

    .line 91
    .line 92
    new-instance p2, Lt1/a;

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p1, p7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    new-instance p3, Lt1/f$d;

    .line 102
    .line 103
    invoke-direct {p3, p0}, Lt1/f$d;-><init>(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    new-instance p4, Lt1/f$e;

    .line 107
    .line 108
    invoke-direct {p4, p0}, Lt1/f$e;-><init>(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {p2, p1, p3, p4}, Lt1/a;-><init>(Landroid/content/pm/PackageManager;Lu4/l;Lu4/p;)V

    .line 112
    .line 113
    .line 114
    iput-object p2, p0, Lt1/f;->n:Lt1/a;

    .line 115
    .line 116
    invoke-direct {p0}, Lt1/f;->U()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method private final M(Ljava/lang/String;Landroid/os/UserHandle;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lt1/c;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Lt1/c;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Lt1/d;

    .line 13
    .line 14
    invoke-direct {p1, v0}, Lt1/d;-><init>(Lu4/l;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/Set;->removeIf(Ljava/util/function/Predicate;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method private static final N(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/launcher3/util/E;)Z
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 19
    .line 20
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method private static final O(Lu4/l;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static final Q(Lt1/g;)[Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lt1/f;->o:Lt1/f$b;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lt1/f$b;->b(Lt1/g;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private static final S(Lt1/f;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lt1/f;->T(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final U()V
    .locals 1

    .line 1
    iget-object v0, p0, Lt1/f;->e:Ls1/T;

    .line 2
    .line 3
    invoke-virtual {v0}, Ls1/T;->v()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lt1/f;->m:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final V(Lcom/android/launcher3/util/E;Lt1/f$a;Landroid/database/Cursor;Lt1/g;Lt1/j;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            "Landroid/database/Cursor;",
            "Lt1/g;",
            "Lt1/j<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v7, p2

    .line 2
    .line 3
    move-object/from16 v8, p3

    .line 4
    .line 5
    sget-object v0, Ls1/d;->h:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    sget v2, Lt1/f;->D:I

    .line 8
    .line 9
    invoke-interface {v8, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/16 v3, 0xff

    .line 14
    .line 15
    invoke-static {v2, v3}, Ls1/q;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v0, v2}, Ls1/d;->p(Landroid/graphics/Bitmap;I)Ls1/d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, v7, Lt1/f$a;->a:Ls1/d;

    .line 24
    .line 25
    sget v0, Lt1/f;->C:I

    .line 26
    .line 27
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v9, "user"

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iput-object v0, v7, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 43
    .line 44
    iget-object v2, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-static {v2, v9}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0, v2}, Lt1/f;->D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, v7, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    const-string v0, ""

    .line 57
    .line 58
    iput-object v0, v7, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 59
    .line 60
    iput-object v0, v7, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 61
    .line 62
    :goto_1
    invoke-virtual/range {p4 .. p4}, Lt1/g;->e()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_4

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    :try_start_0
    sget v2, Lt1/f;->F:I

    .line 70
    .line 71
    invoke-interface {v8, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    if-nez v2, :cond_2

    .line 76
    .line 77
    return v0

    .line 78
    :cond_2
    array-length v3, v2

    .line 79
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    .line 80
    .line 81
    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 82
    .line 83
    .line 84
    sget-object v5, Lh4/t;->a:Lh4/t;

    .line 85
    .line 86
    invoke-static {v2, v0, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    iget-object v3, v7, Lt1/f$a;->a:Ls1/d;

    .line 94
    .line 95
    iget v3, v3, Ls1/d;->b:I

    .line 96
    .line 97
    invoke-static {v2, v3}, Ls1/d;->p(Landroid/graphics/Bitmap;I)Ls1/d;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iput-object v2, v7, Lt1/f$a;->a:Ls1/d;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    invoke-static {}, Ls1/b;->M()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    invoke-virtual {p0}, Lt1/f;->v()Ls1/b;

    .line 110
    .line 111
    .line 112
    move-result-object v10

    .line 113
    :try_start_1
    invoke-virtual {v10}, Ls1/b;->U()Ls1/U;

    .line 114
    .line 115
    .line 116
    move-result-object v11

    .line 117
    sget v0, Lt1/f;->G:I

    .line 118
    .line 119
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 120
    .line 121
    .line 122
    move-result-object v12

    .line 123
    if-eqz v11, :cond_3

    .line 124
    .line 125
    if-eqz v12, :cond_3

    .line 126
    .line 127
    iget-object v13, v7, Lt1/f$a;->a:Ls1/d;

    .line 128
    .line 129
    new-instance v0, Ls1/n0;

    .line 130
    .line 131
    sget v2, Lt1/f;->H:I

    .line 132
    .line 133
    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    const/16 v5, 0x8

    .line 138
    .line 139
    const/4 v6, 0x0

    .line 140
    const/4 v4, 0x0

    .line 141
    move-object v1, p1

    .line 142
    move-object/from16 v2, p5

    .line 143
    .line 144
    invoke-direct/range {v0 .. v6}, Ls1/n0;-><init>(Lcom/android/launcher3/util/E;Lt1/j;Ljava/lang/String;ZILkotlin/jvm/internal/j;)V

    .line 145
    .line 146
    .line 147
    invoke-interface {v11, v12, v13, v10, v0}, Ls1/U;->b([BLs1/d;Ls1/b;Ls1/n0;)Ls1/p0;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v13, v0}, Ls1/d;->r(Ls1/p0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :catchall_0
    move-exception v0

    .line 156
    move-object p0, v0

    .line 157
    goto :goto_3

    .line 158
    :cond_3
    :goto_2
    const/4 v0, 0x0

    .line 159
    invoke-static {v10, v0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 160
    .line 161
    .line 162
    goto :goto_4

    .line 163
    :goto_3
    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 164
    :catchall_1
    move-exception v0

    .line 165
    invoke-static {v10, p0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :catch_0
    return v0

    .line 170
    :cond_4
    :goto_4
    iget-object v0, v7, Lt1/f$a;->a:Ls1/d;

    .line 171
    .line 172
    sget v2, Lt1/f;->E:I

    .line 173
    .line 174
    invoke-interface {v8, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    iput v2, v0, Ls1/d;->d:I

    .line 179
    .line 180
    iget-object v0, v7, Lt1/f$a;->a:Ls1/d;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 183
    .line 184
    invoke-static {v1, v9}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, v1}, Lt1/f;->E(Landroid/os/UserHandle;)Lcom/android/launcher3/util/p0;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {v0, p0}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iput-object p0, v7, Lt1/f$a;->a:Ls1/d;

    .line 196
    .line 197
    const/4 p0, 0x1

    .line 198
    return p0
.end method

.method public static synthetic a(Ljava/util/function/Supplier;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0}, Lt1/f;->k(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/launcher3/util/E;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lt1/f;->N(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/launcher3/util/E;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lu4/l;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lt1/f;->O(Lu4/l;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic d(Lt1/f;II)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lt1/f;->S(Lt1/f;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final f(Ls1/d;Ljava/lang/CharSequence;Landroid/content/ComponentName;JLjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ls1/d;->b()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    sget-object v1, Lt1/f;->v:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    invoke-static {v3}, Ls1/q;->b(Landroid/graphics/Bitmap;)[B

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 22
    .line 23
    .line 24
    sget-object v1, Lt1/f;->x:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1}, Ls1/d;->j()Ls1/p0;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    invoke-interface {v3}, Ls1/p0;->serialize()[B

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :cond_0
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget-object v1, Lt1/f;->v:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 43
    .line 44
    .line 45
    sget-object v1, Lt1/f;->x:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 48
    .line 49
    .line 50
    :goto_0
    sget-object v1, Lt1/f;->w:Ljava/lang/String;

    .line 51
    .line 52
    iget v2, p1, Ls1/d;->b:I

    .line 53
    .line 54
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 59
    .line 60
    .line 61
    sget-object v1, Lt1/f;->y:Ljava/lang/String;

    .line 62
    .line 63
    iget p1, p1, Ls1/d;->d:I

    .line 64
    .line 65
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 70
    .line 71
    .line 72
    sget-object p1, Lt1/f;->z:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sget-object p1, Lt1/f;->s:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p3}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    sget-object p1, Lt1/f;->t:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 97
    .line 98
    .line 99
    sget-object p1, Lt1/f;->u:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, p1, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lt1/f;->j:Lt1/f$c;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Z1;->f(Landroid/content/ContentValues;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method private final g()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lt1/f;->c:Landroid/os/Looper;

    .line 6
    .line 7
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "Cache accessed on wrong thread "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v0
.end method

.method public static synthetic j(Lt1/f;Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;ILjava/lang/Object;)Lt1/f$a;
    .locals 7

    .line 1
    if-nez p8, :cond_1

    .line 2
    .line 3
    and-int/lit8 p7, p7, 0x20

    .line 4
    .line 5
    if-eqz p7, :cond_0

    .line 6
    .line 7
    const/4 p6, 0x0

    .line 8
    :cond_0
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move-object v2, p2

    .line 11
    move-object v3, p3

    .line 12
    move-object v4, p4

    .line 13
    move-object v5, p5

    .line 14
    move-object v6, p6

    .line 15
    invoke-virtual/range {v0 .. v6}, Lt1/f;->i(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;)Lt1/f$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 21
    .line 22
    const-string p1, "Super calls with default arguments not supported in this target, function: cacheLocked"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method private static final k(Ljava/util/function/Supplier;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final l(Lh4/e;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lh4/e<",
            "+TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r(Lt1/f;Ljava/lang/String;Landroid/os/UserHandle;Lt1/g;ILjava/lang/Object;)Lt1/f$a;
    .locals 0

    .line 1
    if-nez p5, :cond_1

    .line 2
    .line 3
    and-int/lit8 p4, p4, 0x4

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    sget-object p3, Lt1/g;->d:Lt1/g;

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lt1/f;->q(Ljava/lang/String;Landroid/os/UserHandle;Lt1/g;)Lt1/f$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 15
    .line 16
    const-string p1, "Super calls with default arguments not supported in this target, function: getEntryForPackageLocked"

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p0
.end method


# virtual methods
.method public final A()Landroid/content/pm/PackageManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/f;->f:Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract B(Landroid/os/UserHandle;)J
.end method

.method public final C()Lt1/n;
    .locals 3

    .line 1
    invoke-direct {p0}, Lt1/f;->U()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lt1/f;->i:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object v1, p0, Lt1/f;->h:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lt1/n;

    .line 12
    .line 13
    iget-object v1, p0, Lt1/f;->j:Lt1/f$c;

    .line 14
    .line 15
    iget-object v2, p0, Lt1/f;->i:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-direct {v0, p0, v1, v2}, Lt1/n;-><init>(Lt1/f;Lcom/android/launcher3/util/Z1;Landroid/os/Handler;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public final D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    const-string v0, "label"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/os/UserHandle;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lt1/f;->m:Landroid/util/SparseArray;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-gez v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lt1/f;->f:Landroid/content/pm/PackageManager;

    .line 24
    .line 25
    const-string v2, "%1$s"

    .line 26
    .line 27
    invoke-virtual {v1, v2, p2}, Landroid/content/pm/PackageManager;->getUserBadgedLabel(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    :cond_0
    iget-object p0, p0, Lt1/f;->m:Landroid/util/SparseArray;

    .line 43
    .line 44
    invoke-virtual {p0, v0, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object p0, p0, Lt1/f;->m:Landroid/util/SparseArray;

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    move-object p2, p0

    .line 55
    check-cast p2, Ljava/lang/String;

    .line 56
    .line 57
    :goto_0
    if-nez p2, :cond_2

    .line 58
    .line 59
    return-object p1

    .line 60
    :cond_2
    sget-object p0, Lkotlin/jvm/internal/G;->a:Lkotlin/jvm/internal/G;

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p1, p0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "format(...)"

    .line 76
    .line 77
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object p0
.end method

.method protected final E(Landroid/os/UserHandle;)Lcom/android/launcher3/util/p0;
    .locals 3

    .line 1
    const-string v0, "user"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/os/UserHandle;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lt1/f;->l:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ltz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lt1/f;->l:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "valueAt(...)"

    .line 25
    .line 26
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    check-cast p0, Lcom/android/launcher3/util/p0;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lt1/f;->v()Ls1/b;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :try_start_0
    new-instance v2, Ls1/b$c;

    .line 37
    .line 38
    invoke-direct {v2}, Ls1/b$c;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, p1}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v1, p1}, Ls1/b;->F(Ls1/b$c;)Lcom/android/launcher3/util/p0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v2, "getBitmapFlagOp(...)"

    .line 50
    .line 51
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lt1/f;->l:Landroid/util/SparseArray;

    .line 55
    .line 56
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    invoke-static {v1, p0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    return-object p1

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 66
    :catchall_1
    move-exception p1

    .line 67
    invoke-static {v1, p0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    throw p1
.end method

.method public final F(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lt1/f;->e:Ls1/T;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ls1/T;->o(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final G(Ls1/d;Landroid/os/UserHandle;)Z
    .locals 1

    .line 1
    const-string v0, "icon"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    iget-object p1, p1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method protected abstract H(Landroid/content/pm/ApplicationInfo;)Z
.end method

.method protected final I(Ljava/lang/Object;Lt1/f$a;Lt1/j;ZZLandroid/content/ComponentName;Landroid/os/UserHandle;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lt1/f$a;",
            "Lt1/j<",
            "TT;>;ZZ",
            "Landroid/content/ComponentName;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "entry"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "cachingLogic"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "componentName"

    .line 12
    .line 13
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "user"

    .line 17
    .line 18
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p4, p0, Lt1/f;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-interface {p3, p4, p0, p1}, Lt1/j;->d(Landroid/content/Context;Lt1/f;Ljava/lang/Object;)Ls1/d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iput-object p0, p2, Lt1/f$a;->a:Ls1/d;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    if-eqz p4, :cond_1

    .line 33
    .line 34
    invoke-virtual {p6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string p1, "getPackageName(...)"

    .line 39
    .line 40
    invoke-static {v1, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 v4, 0x4

    .line 44
    const/4 v5, 0x0

    .line 45
    const/4 v3, 0x0

    .line 46
    move-object v0, p0

    .line 47
    move-object v2, p7

    .line 48
    invoke-static/range {v0 .. v5}, Lt1/f;->r(Lt1/f;Ljava/lang/String;Landroid/os/UserHandle;Lt1/g;ILjava/lang/Object;)Lt1/f$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p1, p0, Lt1/f$a;->a:Ls1/d;

    .line 53
    .line 54
    iput-object p1, p2, Lt1/f$a;->a:Ls1/d;

    .line 55
    .line 56
    iget-object p1, p0, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 57
    .line 58
    iput-object p1, p2, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 59
    .line 60
    if-eqz p5, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 63
    .line 64
    iput-object p0, p2, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method protected final J(Ljava/lang/Object;Lt1/f$a;Lt1/j;Landroid/os/UserHandle;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lt1/f$a;",
            "Lt1/j<",
            "TT;>;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "obj"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "entry"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "cachingLogic"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "user"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p3, p1}, Lt1/j;->a(Ljava/lang/Object;)Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    :cond_0
    invoke-interface {p3, p1}, Lt1/j;->h(Ljava/lang/Object;)Landroid/content/ComponentName;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string p1, "getPackageName(...)"

    .line 42
    .line 43
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iput-object v0, p2, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 47
    .line 48
    invoke-virtual {p0, v0, p4}, Lt1/f;->D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iput-object p0, p2, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 53
    .line 54
    return-void
.end method

.method protected K(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    const-string p0, "message"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "BaseIconCache"

    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final declared-synchronized L(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lt1/f$a;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "componentName"

    .line 3
    .line 4
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v0, "user"

    .line 8
    .line 9
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 13
    .line 14
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 15
    .line 16
    invoke-direct {v1, p1, p2}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lt1/f$a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-object p1

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public final declared-synchronized P(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "packageName"

    .line 3
    .line 4
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v0, "user"

    .line 8
    .line 9
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1, p2}, Lt1/f;->M(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lt1/f;->j:Lt1/f$c;

    .line 16
    .line 17
    sget-object v1, Lt1/f;->s:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v2, Lt1/f;->t:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v3, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " LIKE ? AND "

    .line 30
    .line 31
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, " = ?"

    .line 38
    .line 39
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v3, "/%"

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0, p2}, Lt1/f;->B(Landroid/os/UserHandle;)J

    .line 64
    .line 65
    .line 66
    move-result-wide v3

    .line 67
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    filled-new-array {v2, p2}, [Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/util/Z1;->e(Ljava/lang/String;[Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lt1/f;->a:Landroid/content/Context;

    .line 79
    .line 80
    invoke-static {p2, p1}, Lcom/android/launcher3/util/D1;->b(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    .line 82
    .line 83
    monitor-exit p0

    .line 84
    return-void

    .line 85
    :catchall_0
    move-exception p1

    .line 86
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    throw p1
.end method

.method public final R(II)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lt1/f;->i:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lt1/e;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lt1/e;-><init>(Lt1/f;II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method protected declared-synchronized T(II)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Lt1/f;->d:I

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lt1/f;->k:Ls1/d;

    .line 6
    .line 7
    iget-object p1, p0, Lt1/f;->l:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/util/SparseArray;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lt1/f;->j:Lt1/f$c;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z1;->c()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lt1/f;->j:Lt1/f$c;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z1;->d()V

    .line 20
    .line 21
    .line 22
    new-instance p1, Lt1/f$c;

    .line 23
    .line 24
    iget-object v0, p0, Lt1/f;->a:Landroid/content/Context;

    .line 25
    .line 26
    iget-object v1, p0, Lt1/f;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-direct {p1, v0, v1, p2}, Lt1/f$c;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lt1/f;->j:Lt1/f$c;

    .line 32
    .line 33
    iget-object p1, p0, Lt1/f;->g:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Map;->clear()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteReadOnlyDatabaseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :catch_0
    move-exception p1

    .line 42
    :try_start_1
    const-string p2, "BaseIconCache"

    .line 43
    .line 44
    const-string v0, "failed to clear the launcher\'s icon db or cache."

    .line 45
    .line 46
    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    .line 49
    :goto_0
    monitor-exit p0

    .line 50
    return-void

    .line 51
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    throw p1
.end method

.method public final declared-synchronized e(Ljava/lang/Object;Lt1/j;J)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lt1/j<",
            "TT;>;J)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "obj"

    .line 3
    .line 4
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v0, "cachingLogic"

    .line 8
    .line 9
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2, p1}, Lt1/j;->g(Ljava/lang/Object;)Landroid/os/UserHandle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {p2, p1}, Lt1/j;->h(Ljava/lang/Object;)Landroid/content/ComponentName;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 21
    .line 22
    invoke-direct {v1, v4, v0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lt1/f;->a:Landroid/content/Context;

    .line 26
    .line 27
    invoke-interface {p2, v2, p0, p1}, Lt1/j;->d(Landroid/content/Context;Lt1/f;Ljava/lang/Object;)Ls1/d;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ls1/d;->l()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, v2, v0}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    iget-object v3, v2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    :cond_0
    move-object v1, p0

    .line 52
    goto :goto_3

    .line 53
    :cond_1
    invoke-interface {p2, p1}, Lt1/j;->a(Ljava/lang/Object;)Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    :try_start_1
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 60
    .line 61
    .line 62
    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    if-nez v5, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    move-object p1, v0

    .line 68
    move-object v1, p0

    .line 69
    goto :goto_4

    .line 70
    :cond_2
    :goto_0
    :try_start_2
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    const-string v5, "getPackageName(...)"

    .line 75
    .line 76
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object v5, p0, Lt1/f;->g:Ljava/util/Map;

    .line 80
    .line 81
    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 85
    if-eqz v5, :cond_4

    .line 86
    .line 87
    :try_start_3
    new-instance v5, Lt1/f$a;

    .line 88
    .line 89
    invoke-direct {v5}, Lt1/f$a;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v2, v5, Lt1/f$a;->a:Ls1/d;

    .line 93
    .line 94
    iput-object v3, v5, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 95
    .line 96
    invoke-virtual {p0, v3, v0}, Lt1/f;->D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    iput-object v6, v5, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 101
    .line 102
    iget-object v6, p0, Lt1/f;->g:Ljava/util/Map;

    .line 103
    .line 104
    invoke-interface {v6, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    .line 106
    .line 107
    :cond_4
    :try_start_4
    iget-object v1, p0, Lt1/f;->e:Ls1/T;

    .line 108
    .line 109
    invoke-interface {p2, p1, v1}, Lt1/j;->c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 113
    if-eqz v7, :cond_5

    .line 114
    .line 115
    move-object v1, p0

    .line 116
    move-wide v5, p3

    .line 117
    :try_start_5
    invoke-direct/range {v1 .. v7}, Lt1/f;->f(Ls1/d;Ljava/lang/CharSequence;Landroid/content/ComponentName;JLjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :catchall_1
    move-exception v0

    .line 122
    :goto_1
    move-object p1, v0

    .line 123
    goto :goto_4

    .line 124
    :cond_5
    move-object v1, p0

    .line 125
    :goto_2
    iget-object p0, v1, Lt1/f;->a:Landroid/content/Context;

    .line 126
    .line 127
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const/4 p2, -0x1

    .line 132
    invoke-static {p0, p1, v0, p2}, Lcom/android/launcher3/util/D1;->k(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 133
    .line 134
    .line 135
    monitor-exit v1

    .line 136
    return-void

    .line 137
    :catchall_2
    move-exception v0

    .line 138
    move-object v1, p0

    .line 139
    goto :goto_1

    .line 140
    :goto_3
    monitor-exit v1

    .line 141
    return-void

    .line 142
    :goto_4
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 143
    throw p1
.end method

.method protected final h(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;)Lt1/f$a;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/ComponentName;",
            "Landroid/os/UserHandle;",
            "Ljava/util/function/Supplier<",
            "TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/g;",
            ")",
            "Lt1/f$a;"
        }
    .end annotation

    .line 1
    const-string v0, "componentName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "infoProvider"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "cachingLogic"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "lookupFlags"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v8, 0x20

    .line 27
    .line 28
    const/4 v9, 0x0

    .line 29
    const/4 v7, 0x0

    .line 30
    move-object v1, p0

    .line 31
    move-object v2, p1

    .line 32
    move-object v3, p2

    .line 33
    move-object v4, p3

    .line 34
    move-object v5, p4

    .line 35
    move-object v6, p5

    .line 36
    invoke-static/range {v1 .. v9}, Lt1/f;->j(Lt1/f;Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;ILjava/lang/Object;)Lt1/f$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method protected i(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;)Lt1/f$a;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/ComponentName;",
            "Landroid/os/UserHandle;",
            "Ljava/util/function/Supplier<",
            "TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/g;",
            "Landroid/database/Cursor;",
            ")",
            "Lt1/f$a;"
        }
    .end annotation

    .line 1
    const-string v1, "componentName"

    .line 2
    .line 3
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "user"

    .line 7
    .line 8
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "infoProvider"

    .line 12
    .line 13
    invoke-static {p3, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "cachingLogic"

    .line 17
    .line 18
    invoke-static {p4, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v1, "lookupFlags"

    .line 22
    .line 23
    invoke-static {p5, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lt1/f;->g()V

    .line 27
    .line 28
    .line 29
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 30
    .line 31
    invoke-direct {v1, p1, p2}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lt1/f;->g:Ljava/util/Map;

    .line 35
    .line 36
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    move-object v5, v2

    .line 43
    check-cast v5, Lt1/f$a;

    .line 44
    .line 45
    iget-object v5, v5, Lt1/f$a;->a:Ls1/d;

    .line 46
    .line 47
    invoke-virtual {v5}, Ls1/d;->h()Lt1/g;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v5, p5}, Lt1/g;->b(Lt1/g;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_8

    .line 56
    .line 57
    :cond_0
    if-nez v2, :cond_2

    .line 58
    .line 59
    invoke-virtual {p5}, Lt1/g;->c()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/4 v2, 0x0

    .line 67
    goto :goto_1

    .line 68
    :cond_2
    :goto_0
    const/4 v2, 0x1

    .line 69
    :goto_1
    new-instance v5, Lt1/f$a;

    .line 70
    .line 71
    invoke-direct {v5}, Lt1/f$a;-><init>()V

    .line 72
    .line 73
    .line 74
    if-eqz v2, :cond_3

    .line 75
    .line 76
    iget-object v2, p0, Lt1/f;->g:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {v2, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    :cond_3
    if-nez p6, :cond_4

    .line 82
    .line 83
    invoke-virtual {p0, v1, v5, p5, p4}, Lt1/f;->s(Lcom/android/launcher3/util/E;Lt1/f$a;Lt1/g;Lt1/j;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    move-object v2, v5

    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move-object v0, p0

    .line 90
    move-object v4, p5

    .line 91
    move-object/from16 v3, p6

    .line 92
    .line 93
    move-object v2, v5

    .line 94
    move-object v5, p4

    .line 95
    invoke-direct/range {v0 .. v5}, Lt1/f;->V(Lcom/android/launcher3/util/E;Lt1/f$a;Landroid/database/Cursor;Lt1/g;Lt1/j;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    :goto_2
    invoke-static {}, Ls1/b;->M()Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-nez v4, :cond_6

    .line 104
    .line 105
    iget-object v4, v2, Lt1/f$a;->a:Ls1/d;

    .line 106
    .line 107
    invoke-virtual {v4}, Ls1/d;->i()Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    if-nez v4, :cond_6

    .line 112
    .line 113
    iget-object v4, v2, Lt1/f$a;->a:Ls1/d;

    .line 114
    .line 115
    invoke-interface {p3}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    if-eqz v5, :cond_5

    .line 120
    .line 121
    iget-object v9, p0, Lt1/f;->a:Landroid/content/Context;

    .line 122
    .line 123
    invoke-interface {p4, v9, v5}, Lt1/j;->e(Landroid/content/Context;Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    goto :goto_3

    .line 128
    :cond_5
    const/4 v5, 0x0

    .line 129
    :goto_3
    invoke-virtual {v4, v5}, Ls1/d;->q(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    :cond_6
    new-instance v4, Lt1/b;

    .line 133
    .line 134
    invoke-direct {v4, p3}, Lt1/b;-><init>(Ljava/util/function/Supplier;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v4}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 138
    .line 139
    .line 140
    move-result-object v8

    .line 141
    if-nez v1, :cond_7

    .line 142
    .line 143
    invoke-static {v8}, Lt1/f;->l(Lh4/e;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p5}, Lt1/g;->f()Z

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    const/4 v5, 0x1

    .line 152
    move-object v0, p0

    .line 153
    move-object v6, p1

    .line 154
    move-object v7, p2

    .line 155
    move-object v3, p4

    .line 156
    invoke-virtual/range {v0 .. v7}, Lt1/f;->I(Ljava/lang/Object;Lt1/f$a;Lt1/j;ZZLandroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 157
    .line 158
    .line 159
    :cond_7
    iget-object v1, v2, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 160
    .line 161
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_8

    .line 166
    .line 167
    invoke-static {v8}, Lt1/f;->l(Lh4/e;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    if-eqz v1, :cond_8

    .line 172
    .line 173
    invoke-virtual {p0, v1, v2, p4, p2}, Lt1/f;->J(Ljava/lang/Object;Lt1/f$a;Lt1/j;Landroid/os/UserHandle;)V

    .line 174
    .line 175
    .line 176
    :cond_8
    check-cast v2, Lt1/f$a;

    .line 177
    .line 178
    return-object v2
.end method

.method protected final declared-synchronized m(Ljava/lang/String;Landroid/os/UserHandle;Landroid/graphics/Bitmap;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "packageName"

    .line 3
    .line 4
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v0, "user"

    .line 8
    .line 9
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1, p2}, Lt1/f;->M(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 13
    .line 14
    .line 15
    sget-object v0, Lt1/f;->o:Lt1/f$b;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2}, Lt1/f$b;->a(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/util/E;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lt1/f$a;

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Lt1/f$a;

    .line 32
    .line 33
    invoke-direct {v0}, Lt1/f$a;-><init>()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_3

    .line 39
    :cond_0
    :goto_0
    if-eqz p4, :cond_2

    .line 40
    .line 41
    invoke-interface {p4}, Ljava/lang/CharSequence;->length()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iput-object p4, v0, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 49
    .line 50
    :cond_2
    :goto_1
    if-eqz p3, :cond_3

    .line 51
    .line 52
    invoke-virtual {p0}, Lt1/f;->v()Ls1/b;

    .line 53
    .line 54
    .line 55
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    :try_start_1
    invoke-virtual {v1, p3}, Ls1/b;->B(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    new-instance v2, Ls1/b$c;

    .line 61
    .line 62
    invoke-direct {v2}, Ls1/b$c;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, p2}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {v1, p3, p2}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    iput-object p2, v0, Lt1/f$a;->a:Ls1/d;

    .line 74
    .line 75
    sget-object p2, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    :try_start_2
    invoke-static {v1, p2}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :catchall_1
    move-exception p1

    .line 83
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 84
    :catchall_2
    move-exception p2

    .line 85
    :try_start_4
    invoke-static {v1, p1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    throw p2

    .line 89
    :cond_3
    :goto_2
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_4

    .line 94
    .line 95
    iget-object p2, v0, Lt1/f$a;->a:Ls1/d;

    .line 96
    .line 97
    iget-object p2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 98
    .line 99
    if-eqz p2, :cond_4

    .line 100
    .line 101
    iget-object p2, p0, Lt1/f;->g:Ljava/util/Map;

    .line 102
    .line 103
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 104
    .line 105
    .line 106
    :cond_4
    monitor-exit p0

    .line 107
    return-void

    .line 108
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 109
    throw p1
.end method

.method public final declared-synchronized n()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lt1/f;->j:Lt1/f$c;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z1;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method protected final o()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public final declared-synchronized p(Landroid/os/UserHandle;)Ls1/d;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "user"

    .line 3
    .line 4
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lt1/f;->k:Ls1/d;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lt1/f;->v()Ls1/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    :try_start_1
    iget-object v1, p0, Lt1/f;->e:Ls1/T;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ls1/b;->d0(Ls1/T;)Ls1/d;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lt1/f;->k:Ls1/d;

    .line 22
    .line 23
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    :try_start_2
    invoke-static {v0, v1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_1

    .line 32
    :catchall_1
    move-exception p1

    .line 33
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 34
    :catchall_2
    move-exception v1

    .line 35
    :try_start_4
    invoke-static {v0, p1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    throw v1

    .line 39
    :cond_0
    :goto_0
    iget-object v0, p0, Lt1/f;->k:Ls1/d;

    .line 40
    .line 41
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lt1/f;->E(Landroid/os/UserHandle;)Lcom/android/launcher3/util/p0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p1}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "withFlags(...)"

    .line 53
    .line 54
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 55
    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-object p1

    .line 59
    :goto_1
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 60
    throw p1
.end method

.method protected final q(Ljava/lang/String;Landroid/os/UserHandle;Lt1/g;)Lt1/f$a;
    .locals 14

    .line 1
    move-object/from16 v2, p2

    .line 2
    .line 3
    move-object/from16 v7, p3

    .line 4
    .line 5
    const-string v3, "packageName"

    .line 6
    .line 7
    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v3, "user"

    .line 11
    .line 12
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v3, "lookupFlags"

    .line 16
    .line 17
    invoke-static {v7, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lt1/f;->g()V

    .line 21
    .line 22
    .line 23
    sget-object v3, Lt1/f;->o:Lt1/f$b;

    .line 24
    .line 25
    invoke-virtual {v3, p1, v2}, Lt1/f$b;->a(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/util/E;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    iget-object v3, p0, Lt1/f;->g:Ljava/util/Map;

    .line 30
    .line 31
    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    move-object v4, v3

    .line 38
    check-cast v4, Lt1/f$a;

    .line 39
    .line 40
    iget-object v4, v4, Lt1/f$a;->a:Ls1/d;

    .line 41
    .line 42
    invoke-virtual {v4}, Ls1/d;->h()Lt1/g;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4, v7}, Lt1/g;->b(Lt1/g;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_6

    .line 51
    .line 52
    :cond_0
    new-instance v9, Lt1/f$a;

    .line 53
    .line 54
    invoke-direct {v9}, Lt1/f$a;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lt1/f;->n:Lt1/a;

    .line 58
    .line 59
    invoke-virtual {p0, v8, v9, v7, v3}, Lt1/f;->s(Lcom/android/launcher3/util/E;Lt1/f$a;Lt1/g;Lt1/j;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const/4 v10, 0x0

    .line 64
    const/4 v11, 0x1

    .line 65
    if-nez v3, :cond_2

    .line 66
    .line 67
    :try_start_0
    iget-object v3, p0, Lt1/f;->a:Landroid/content/Context;

    .line 68
    .line 69
    const-class v4, Landroid/content/pm/LauncherApps;

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    check-cast v3, Landroid/content/pm/LauncherApps;

    .line 79
    .line 80
    const/16 v4, 0x2000

    .line 81
    .line 82
    invoke-virtual {v3, p1, v4, v2}, Landroid/content/pm/LauncherApps;->getApplicationInfo(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    if-eqz v3, :cond_1

    .line 87
    .line 88
    iget-object v1, p0, Lt1/f;->n:Lt1/a;

    .line 89
    .line 90
    iget-object v4, p0, Lt1/f;->a:Landroid/content/Context;

    .line 91
    .line 92
    invoke-virtual {v1, v4, p0, v3}, Lt1/a;->n(Landroid/content/Context;Lt1/f;Landroid/content/pm/ApplicationInfo;)Ls1/d;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iput-object v1, v9, Lt1/f$a;->a:Ls1/d;

    .line 97
    .line 98
    iget-object v4, p0, Lt1/f;->n:Lt1/a;

    .line 99
    .line 100
    invoke-virtual {p0, v3, v9, v4, v2}, Lt1/f;->J(Ljava/lang/Object;Lt1/f$a;Lt1/j;Landroid/os/UserHandle;)V

    .line 101
    .line 102
    .line 103
    iget-object v4, p0, Lt1/f;->n:Lt1/a;

    .line 104
    .line 105
    iget-object v5, p0, Lt1/f;->e:Ls1/T;

    .line 106
    .line 107
    invoke-virtual {v4, v3, v5}, Lt1/a;->k(Landroid/content/pm/ApplicationInfo;Ls1/T;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    if-eqz v6, :cond_2

    .line 112
    .line 113
    iget-object v3, v9, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 114
    .line 115
    move-object v4, v3

    .line 116
    iget-object v3, v8, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 117
    .line 118
    const-string v5, "componentName"

    .line 119
    .line 120
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v2}, Lt1/f;->B(Landroid/os/UserHandle;)J

    .line 124
    .line 125
    .line 126
    move-result-wide v12

    .line 127
    move-object v0, p0

    .line 128
    move-object v2, v4

    .line 129
    move-wide v4, v12

    .line 130
    invoke-direct/range {v0 .. v6}, Lt1/f;->f(Ls1/d;Ljava/lang/CharSequence;Landroid/content/ComponentName;JLjava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_1
    new-instance v2, Landroid/content/pm/PackageManager$NameNotFoundException;

    .line 135
    .line 136
    const-string v3, "ApplicationInfo is null"

    .line 137
    .line 138
    invoke-direct {v2, v3}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    sget-object v3, Lkotlin/jvm/internal/G;->a:Lkotlin/jvm/internal/G;

    .line 142
    .line 143
    const-string v3, "ApplicationInfo is null for %s"

    .line 144
    .line 145
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-static {v1, v11}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    const-string v3, "format(...)"

    .line 158
    .line 159
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0, v1, v2}, Lt1/f;->K(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 163
    .line 164
    .line 165
    throw v2
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :catch_0
    move v1, v10

    .line 167
    goto :goto_1

    .line 168
    :cond_2
    :goto_0
    move v1, v11

    .line 169
    :goto_1
    invoke-virtual {v7}, Lt1/g;->c()Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-eqz v2, :cond_3

    .line 174
    .line 175
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    if-nez v2, :cond_4

    .line 180
    .line 181
    :cond_3
    move v10, v11

    .line 182
    :cond_4
    if-eqz v1, :cond_5

    .line 183
    .line 184
    if-eqz v10, :cond_5

    .line 185
    .line 186
    iget-object v0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 187
    .line 188
    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    :cond_5
    move-object v3, v9

    .line 192
    :cond_6
    check-cast v3, Lt1/f$a;

    .line 193
    .line 194
    return-object v3
.end method

.method protected final s(Lcom/android/launcher3/util/E;Lt1/f$a;Lt1/g;Lt1/j;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            "Lt1/g;",
            "Lt1/j<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "cacheKey"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "entry"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "lookupFlags"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "cachingLogic"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "loadIconIndividually"

    .line 22
    .line 23
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    :try_start_0
    iget-object v0, p0, Lt1/f;->j:Lt1/f$c;

    .line 28
    .line 29
    sget-object v2, Lt1/f;->o:Lt1/f$b;

    .line 30
    .line 31
    invoke-virtual {v2, p3}, Lt1/f$b;->b(Lt1/g;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    sget-object v3, Lt1/f;->s:Ljava/lang/String;

    .line 36
    .line 37
    sget-object v4, Lt1/f;->t:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v5, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, " = ? AND "

    .line 48
    .line 49
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v3, " = ?"

    .line 56
    .line 57
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget-object v4, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 65
    .line 66
    invoke-virtual {v4}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    iget-object v5, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 71
    .line 72
    const-string v6, "user"

    .line 73
    .line 74
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v5}, Lt1/f;->B(Landroid/os/UserHandle;)J

    .line 78
    .line 79
    .line 80
    move-result-wide v5

    .line 81
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    filled-new-array {v4, v5}, [Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v0, v2, v3, v4}, Lcom/android/launcher3/util/Z1;->i([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 90
    .line 91
    .line 92
    move-result-object v8
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 93
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_0

    .line 98
    .line 99
    invoke-static {v8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    move-object v5, p0

    .line 103
    move-object v6, p1

    .line 104
    move-object v7, p2

    .line 105
    move-object v9, p3

    .line 106
    move-object v10, p4

    .line 107
    invoke-direct/range {v5 .. v10}, Lt1/f;->V(Lcom/android/launcher3/util/E;Lt1/f$a;Landroid/database/Cursor;Lt1/g;Lt1/j;)Z

    .line 108
    .line 109
    .line 110
    move-result p0
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 115
    .line 116
    .line 117
    return p0

    .line 118
    :catchall_0
    move-exception v0

    .line 119
    move-object p0, v0

    .line 120
    move-object v1, v8

    .line 121
    goto :goto_3

    .line 122
    :catch_0
    move-exception v0

    .line 123
    move-object p0, v0

    .line 124
    move-object v1, v8

    .line 125
    goto :goto_1

    .line 126
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 127
    .line 128
    .line 129
    :cond_1
    :goto_0
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :catchall_1
    move-exception v0

    .line 134
    move-object p0, v0

    .line 135
    goto :goto_3

    .line 136
    :catch_1
    move-exception v0

    .line 137
    move-object p0, v0

    .line 138
    :goto_1
    :try_start_2
    const-string p1, "BaseIconCache"

    .line 139
    .line 140
    const-string p2, "Error reading icon cache"

    .line 141
    .line 142
    invoke-static {p1, p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 143
    .line 144
    .line 145
    if-eqz v1, :cond_1

    .line 146
    .line 147
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :goto_2
    const/4 p0, 0x0

    .line 152
    return p0

    .line 153
    :goto_3
    if-eqz v1, :cond_2

    .line 154
    .line 155
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 156
    .line 157
    .line 158
    :cond_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 159
    .line 160
    .line 161
    throw p0
.end method

.method public final t(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lt1/f;->e:Ls1/T;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iget p0, p0, Lt1/f;->d:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1, p0}, Ls1/T;->k(Landroid/content/pm/LauncherActivityInfo;Landroid/content/pm/ComponentInfo;I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final u(Landroid/content/pm/LauncherActivityInfo;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lt1/f;->e:Ls1/T;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget p0, p0, Lt1/f;->d:I

    .line 13
    .line 14
    invoke-virtual {v0, p1, v1, p0}, Ls1/T;->k(Landroid/content/pm/LauncherActivityInfo;Landroid/content/pm/ComponentInfo;I)Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public abstract v()Ls1/b;
.end method

.method public final w()Ls1/T;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/f;->e:Ls1/T;

    .line 2
    .line 3
    return-object p0
.end method

.method public final x()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/f;->h:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y(Lcom/android/launcher3/util/E;)Lt1/f$a;
    .locals 1

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lt1/f;->g()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lt1/f;->g:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lt1/f$a;

    .line 16
    .line 17
    return-object p0
.end method

.method protected final z(Ljava/lang/String;Landroid/os/UserHandle;)Lt1/f$a;
    .locals 1

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lt1/f;->o:Lt1/f$b;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Lt1/f$b;->a(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/util/E;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lt1/f;->y(Lcom/android/launcher3/util/E;)Lt1/f$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
