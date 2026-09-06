.class public final synthetic Lcom/android/launcher3/util/b0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToIntFunction;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/util/Z$c;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/Z$c;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/b0;->a:Lcom/android/launcher3/util/Z$c;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/util/b0;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/util/b0;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final applyAsInt(Ljava/lang/Object;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/b0;->a:Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/util/b0;->b:I

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/b0;->c:I

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/util/p3;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/util/Z$c;->b(Lcom/android/launcher3/util/Z$c;IILcom/android/launcher3/util/p3;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
