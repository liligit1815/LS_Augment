.class Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;
.super Ljava/lang/Object;
.source "KeyboardDragAndDropView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field public final a:LO0/d;

.field public final b:I


# direct methods
.method constructor <init>(LO0/d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->b:I

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(LK/d;)LK/d;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->b:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, LO0/d;->O(ILK/d;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->b:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->b:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    return v0

    .line 30
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->b:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 8
    .line 9
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
