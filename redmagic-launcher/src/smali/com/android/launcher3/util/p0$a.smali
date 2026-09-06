.class Lcom/android/launcher3/util/p0$a;
.super Ljava/lang/Object;
.source "FlagOp.java"

# interfaces
.implements Lcom/android/launcher3/util/p0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/util/p0;->b(I)Lcom/android/launcher3/util/p0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:I

.field final synthetic c:Lcom/android/launcher3/util/p0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/p0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/p0$a;->c:Lcom/android/launcher3/util/p0;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/util/p0$a;->b:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public apply(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/p0$a;->c:Lcom/android/launcher3/util/p0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/android/launcher3/util/p0;->apply(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p0, p0, Lcom/android/launcher3/util/p0$a;->b:I

    .line 8
    .line 9
    or-int/2addr p0, p1

    .line 10
    return p0
.end method
