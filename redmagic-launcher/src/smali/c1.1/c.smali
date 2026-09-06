.class public Lc1/c;
.super Ljava/lang/Object;
.source "CellPosMapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc1/c$a;,
        Lc1/c$b;
    }
.end annotation


# static fields
.field public static final c:Lc1/c;


# instance fields
.field private final a:Z

.field private final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lc1/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    invoke-direct {v0, v1, v2}, Lc1/c;-><init>(ZI)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lc1/c;->c:Lc1/c;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lc1/c;->a:Z

    .line 5
    .line 6
    iput p2, p0, Lc1/c;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;
    .locals 2

    .line 1
    new-instance p0, Lc1/c$a;

    .line 2
    .line 3
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 4
    .line 5
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 6
    .line 7
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1}, Lc1/c$a;-><init>(III)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public b(IIII)Lc1/c$a;
    .locals 1

    .line 1
    const/16 v0, -0x65

    .line 2
    .line 3
    if-ne p4, v0, :cond_1

    .line 4
    .line 5
    iget-boolean p3, p0, Lc1/c;->a:Z

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lc1/c;->b:I

    .line 10
    .line 11
    sub-int/2addr p0, p2

    .line 12
    add-int/lit8 p0, p0, -0x1

    .line 13
    .line 14
    move p3, p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move p3, p1

    .line 17
    :cond_1
    :goto_0
    new-instance p0, Lc1/c$a;

    .line 18
    .line 19
    invoke-direct {p0, p1, p2, p3}, Lc1/c$a;-><init>(III)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method
