.class Lcom/android/launcher3/util/x0$a;
.super Ljava/lang/Object;
.source "IntArray.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/x0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private g:I

.field final synthetic h:Lcom/android/launcher3/util/x0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/x0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/x0$a;->h:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/android/launcher3/util/x0$a;->g:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/x0$a;->g:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/x0$a;->h:Lcom/android/launcher3/util/x0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ge v0, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public next()Ljava/lang/Integer;
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/launcher3/util/x0$a;->h:Lcom/android/launcher3/util/x0;

    iget v1, p0, Lcom/android/launcher3/util/x0$a;->g:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/android/launcher3/util/x0$a;->g:I

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/x0;->v(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0$a;->next()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public remove()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/x0$a;->h:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/util/x0$a;->g:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, -0x1

    .line 6
    .line 7
    iput v1, p0, Lcom/android/launcher3/util/x0$a;->g:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/x0;->y(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
