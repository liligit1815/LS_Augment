.class public final synthetic Lz1/E;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic g:I

.field public final synthetic h:I


# direct methods
.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lz1/E;->g:I

    .line 5
    .line 6
    iput p2, p0, Lz1/E;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget v0, p0, Lz1/E;->g:I

    .line 2
    .line 3
    iget p0, p0, Lz1/E;->h:I

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2}, Lz1/O;->l(IILcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
