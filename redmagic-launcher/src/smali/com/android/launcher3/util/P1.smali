.class public Lcom/android/launcher3/util/P1;
.super Ljava/lang/Object;
.source "PendingSplitSelectInfo.java"


# instance fields
.field private final a:I

.field private final b:I

.field private final c:Lcom/android/launcher3/logging/StatsLogManager$d;


# direct methods
.method public constructor <init>(IILcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/util/P1;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/util/P1;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/util/P1;->c:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/P1;->c:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/P1;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/P1;->a:I

    .line 2
    .line 3
    return p0
.end method
