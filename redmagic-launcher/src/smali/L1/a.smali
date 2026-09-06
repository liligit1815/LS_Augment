.class public LL1/a;
.super Ljava/lang/Object;
.source "ClockStyleDataItem.java"


# instance fields
.field private a:Z

.field private b:I

.field private c:I


# direct methods
.method public constructor <init>(ZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, LL1/a;->a:Z

    .line 5
    .line 6
    iput p2, p0, LL1/a;->b:I

    .line 7
    .line 8
    iput p3, p0, LL1/a;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, LL1/a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LL1/a;->a:Z

    .line 2
    .line 3
    return p0
.end method
