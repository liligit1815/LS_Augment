.class public final LH1/a$a;
.super Ljava/lang/Object;
.source "ResponsiveCellSpecsProvider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LH1/a$a;-><init>()V

    return-void
.end method

.method public static final synthetic a(LH1/a$a;ILH1/q;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH1/a$a;->b(ILH1/q;I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final b(ILH1/q;I)I
    .locals 1

    .line 1
    invoke-virtual {p2}, LH1/q;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return p3

    .line 8
    :cond_0
    const/4 p0, 0x2

    .line 9
    const/4 p3, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p2, p1, v0, p0, p3}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
