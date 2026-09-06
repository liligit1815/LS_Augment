.class Lr/e$a;
.super Ljava/lang/Object;
.source "KeyCycleOscillator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lr/e;->f(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lr/e$c;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lr/e;


# direct methods
.method constructor <init>(Lr/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lr/e$a;->g:Lr/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lr/e$c;Lr/e$c;)I
    .locals 0

    .line 1
    iget p0, p1, Lr/e$c;->a:I

    .line 2
    .line 3
    iget p1, p2, Lr/e$c;->a:I

    .line 4
    .line 5
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lr/e$c;

    .line 2
    .line 3
    check-cast p2, Lr/e$c;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lr/e$a;->a(Lr/e$c;Lr/e$c;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
