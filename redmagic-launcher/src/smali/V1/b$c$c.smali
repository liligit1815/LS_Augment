.class public final LV1/b$c$c;
.super Ljava/lang/Object;
.source "BubbleAnimator.kt"

# interfaces
.implements LV1/b$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LV1/b$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# static fields
.field public static final a:LV1/b$c$c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LV1/b$c$c;

    .line 2
    .line 3
    invoke-direct {v0}, LV1/b$c$c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LV1/b$c$c;->a:LV1/b$c$c;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of p0, p1, LV1/b$c$c;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    return v0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    const p0, -0x16b5ebcc

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Idle"

    .line 2
    .line 3
    return-object p0
.end method
