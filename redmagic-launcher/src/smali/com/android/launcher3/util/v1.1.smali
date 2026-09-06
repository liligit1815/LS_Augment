.class public Lcom/android/launcher3/util/v1;
.super Ljava/lang/Object;
.source "MultiPropertyFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/v1$b;,
        Lcom/android/launcher3/util/v1$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/util/v1<",
            "*>.c;>;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "MultiPropertyFactory"


# instance fields
.field private mAggregationOfOthers:F

.field private final mAggregator:Lcom/android/launcher3/util/v1$b;

.field private mLastIndexSet:I

.field private final mProperties:[Lcom/android/launcher3/util/v1$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/android/launcher3/util/v1<",
            "*>.c;"
        }
    .end annotation
.end field

.field private final mProperty:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected final mTarget:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/v1$a;

    .line 2
    .line 3
    const-string v1, "value"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/v1$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/util/FloatProperty<",
            "TT;>;I",
            "Lcom/android/launcher3/util/v1$b;",
            ")V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;F)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;F)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/util/FloatProperty<",
            "TT;>;I",
            "Lcom/android/launcher3/util/v1$b;",
            "F)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/android/launcher3/util/v1;->mAggregationOfOthers:F

    const/4 v0, -0x1

    .line 4
    iput v0, p0, Lcom/android/launcher3/util/v1;->mLastIndexSet:I

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/util/v1;->mTarget:Ljava/lang/Object;

    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/v1;->mProperty:Landroid/util/FloatProperty;

    .line 7
    iput-object p4, p0, Lcom/android/launcher3/util/v1;->mAggregator:Lcom/android/launcher3/util/v1$b;

    .line 8
    new-array p1, p3, [Lcom/android/launcher3/util/v1$c;

    iput-object p1, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    const/4 p1, 0x0

    :goto_0
    if-ge p1, p3, :cond_0

    .line 9
    iget-object p2, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    new-instance p4, Lcom/android/launcher3/util/v1$c;

    invoke-direct {p4, p0, p1, p5}, Lcom/android/launcher3/util/v1$c;-><init>(Lcom/android/launcher3/util/v1;IF)V

    aput-object p4, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/util/v1;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/v1;->mAggregationOfOthers:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/util/v1;)Lcom/android/launcher3/util/v1$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/v1;->mAggregator:Lcom/android/launcher3/util/v1$b;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/util/v1;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/v1;->mLastIndexSet:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/util/v1;)[Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/util/v1;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/v1;->mAggregationOfOthers:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/util/v1;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/v1;->mLastIndexSet:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method protected apply(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/v1;->mProperty:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/v1;->mTarget:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p0, p1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public varargs dump(Ljava/lang/String;Ljava/io/PrintWriter;Ljava/lang/String;[Ljava/lang/String;)V
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
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {p2, p3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance p3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/16 p1, 0x9

    .line 28
    .line 29
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 p3, 0x0

    .line 37
    :goto_0
    array-length v0, p4

    .line 38
    if-ge p3, v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    .line 41
    .line 42
    array-length v0, v0

    .line 43
    if-lt p3, v0, :cond_0

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    aget-object v1, p4, p3

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, " given for alpha index "

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, " however there are only "

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    .line 72
    .line 73
    array-length v1, v1

    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, " alpha channels."

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    aget-object v1, p4, p3

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_1
    return-void
.end method

.method public get(I)Lcom/android/launcher3/util/v1$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/android/launcher3/util/v1<",
            "TT;>.c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/v1;->mProperties:[Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
