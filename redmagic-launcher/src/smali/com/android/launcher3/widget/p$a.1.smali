.class public Lcom/android/launcher3/widget/p$a;
.super Ljava/lang/Object;
.source "ComponentDetailAdapter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lz1/Z4;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/util/T0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/T0;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/util/T0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/p$a;->g:Lcom/android/launcher3/util/T0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lz1/Z4;Lz1/Z4;)I
    .locals 1

    .line 1
    iget p0, p1, Lz1/Z4;->i:I

    .line 2
    .line 3
    iget v0, p2, Lz1/Z4;->i:I

    .line 4
    .line 5
    iget p1, p1, Lz1/Z4;->j:I

    .line 6
    .line 7
    iget p2, p2, Lz1/Z4;->j:I

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    sub-int/2addr p0, v0

    .line 12
    return p0

    .line 13
    :cond_0
    sub-int/2addr p1, p2

    .line 14
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lz1/Z4;

    .line 2
    .line 3
    check-cast p2, Lz1/Z4;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/p$a;->a(Lz1/Z4;Lz1/Z4;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
