.class public final Lo0/B$d;
.super Ljava/lang/Object;
.source "SplitAttributes.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/B$d$a;
    }
.end annotation


# static fields
.field public static final c:Lo0/B$d$a;

.field public static final d:Lo0/B$d;

.field public static final e:Lo0/B$d;

.field public static final f:Lo0/B$d;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:F


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lo0/B$d$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/B$d$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/B$d;->c:Lo0/B$d$a;

    .line 8
    .line 9
    new-instance v1, Lo0/B$d;

    .line 10
    .line 11
    const-string v2, "expandContainers"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v1, v2, v3}, Lo0/B$d;-><init>(Ljava/lang/String;F)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lo0/B$d;->d:Lo0/B$d;

    .line 18
    .line 19
    const/high16 v1, 0x3f000000    # 0.5f

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lo0/B$d$a;->b(F)Lo0/B$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lo0/B$d;->e:Lo0/B$d;

    .line 26
    .line 27
    new-instance v0, Lo0/B$d;

    .line 28
    .line 29
    const-string v1, "hinge"

    .line 30
    .line 31
    const/high16 v2, -0x40800000    # -1.0f

    .line 32
    .line 33
    invoke-direct {v0, v1, v2}, Lo0/B$d;-><init>(Ljava/lang/String;F)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lo0/B$d;->f:Lo0/B$d;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;F)V
    .locals 1

    .line 1
    const-string v0, "description"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lo0/B$d;->a:Ljava/lang/String;

    .line 10
    .line 11
    iput p2, p0, Lo0/B$d;->b:F

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, Lo0/B$d;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lo0/B$d;

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
    iget v1, p0, Lo0/B$d;->b:F

    .line 12
    .line 13
    check-cast p1, Lo0/B$d;

    .line 14
    .line 15
    iget v3, p1, Lo0/B$d;->b:F

    .line 16
    .line 17
    cmpg-float v1, v1, v3

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Lo0/B$d;->a:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p1, p1, Lo0/B$d;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    return v0

    .line 32
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lo0/B$d;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Lo0/B$d;->b:F

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    mul-int/lit8 p0, p0, 0x1f

    .line 14
    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/B$d;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
