.class public final Lcom/android/launcher3/model/data/D;
.super Lcom/android/launcher3/model/data/I;
.source "TaskItemInfo.kt"


# instance fields
.field private final A:I


# direct methods
.method public constructor <init>(ILcom/android/launcher3/model/data/I;)V
    .locals 1

    .line 1
    const-string v0, "itemInfo"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 7
    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/model/data/D;->A:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final j0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/D;->A:I

    .line 2
    .line 3
    return p0
.end method
