.class Lq/h$a;
.super Ljava/lang/Object;
.source "PriorityGoalRow.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lq/h;->F(Lq/i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lq/i;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lq/h;


# direct methods
.method constructor <init>(Lq/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lq/h$a;->g:Lq/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lq/i;Lq/i;)I
    .locals 0

    .line 1
    iget p0, p1, Lq/i;->i:I

    .line 2
    .line 3
    iget p1, p2, Lq/i;->i:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lq/i;

    .line 2
    .line 3
    check-cast p2, Lq/i;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lq/h$a;->a(Lq/i;Lq/i;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
