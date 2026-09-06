.class public LH3/f;
.super Ljava/lang/Object;


# static fields
.field private static a:I = 0x0

.field private static b:I = 0x0

.field private static c:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a(I)I
    .locals 0

    .line 1
    sput p0, LH3/f;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static b(Z)V
    .locals 0

    .line 1
    sput-boolean p0, LH3/f;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public static c(I)I
    .locals 0

    .line 1
    sput p0, LH3/f;->b:I

    .line 2
    .line 3
    return p0
.end method
