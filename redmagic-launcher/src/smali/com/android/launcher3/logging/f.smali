.class public Lcom/android/launcher3/logging/f;
.super Ljava/lang/Object;
.source "InstanceIdSequence.java"


# instance fields
.field protected final a:I

.field private final b:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/high16 v0, 0x100000

    .line 4
    invoke-direct {p0, v0}, Lcom/android/launcher3/logging/f;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/logging/f;->b:Ljava/util/Random;

    const/4 v0, 0x1

    .line 3
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/high16 v0, 0x100000

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/logging/f;->a:I

    return-void
.end method


# virtual methods
.method public a()Lcom/android/launcher3/logging/d;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/logging/f;->b:Ljava/util/Random;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/logging/f;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logging/f;->b(I)Lcom/android/launcher3/logging/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method protected b(I)Lcom/android/launcher3/logging/d;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/logging/d;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
