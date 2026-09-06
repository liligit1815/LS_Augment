.class public LT0/p$g;
.super Ljava/lang/Object;
.source "FolderAnimationManagerMFV.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LT0/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# static fields
.field private static final e:LT0/p$g;


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LT0/p$g;

    .line 2
    .line 3
    invoke-direct {v0}, LT0/p$g;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LT0/p$g;->e:LT0/p$g;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, LT0/p$g;->a:F

    .line 7
    .line 8
    iput v0, p0, LT0/p$g;->b:F

    .line 9
    .line 10
    iput v0, p0, LT0/p$g;->c:F

    .line 11
    .line 12
    iput v0, p0, LT0/p$g;->d:F

    .line 13
    .line 14
    return-void
.end method

.method public static e()LT0/p$g;
    .locals 1

    .line 1
    sget-object v0, LT0/p$g;->e:LT0/p$g;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, LT0/p$g;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    iget p0, p0, LT0/p$g;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, LT0/p$g;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public d()F
    .locals 0

    .line 1
    iget p0, p0, LT0/p$g;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public f(F)V
    .locals 0

    .line 1
    iput p1, p0, LT0/p$g;->d:F

    .line 2
    .line 3
    return-void
.end method

.method public g(F)V
    .locals 0

    .line 1
    iput p1, p0, LT0/p$g;->c:F

    .line 2
    .line 3
    return-void
.end method

.method public h(F)V
    .locals 0

    .line 1
    iput p1, p0, LT0/p$g;->a:F

    .line 2
    .line 3
    return-void
.end method

.method public i(F)V
    .locals 0

    .line 1
    iput p1, p0, LT0/p$g;->b:F

    .line 2
    .line 3
    return-void
.end method
