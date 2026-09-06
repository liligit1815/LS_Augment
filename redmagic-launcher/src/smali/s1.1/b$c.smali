.class public Ls1/b$c;
.super Ljava/lang/Object;
.source "BaseIconFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field a:Z

.field b:Z

.field c:I

.field d:Landroid/os/UserHandle;

.field e:Lcom/android/launcher3/util/N2;

.field f:Ljava/lang/Integer;

.field g:Ls1/n0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ls1/b$c;->c:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(I)Ls1/b$c;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ls1/b$c;->f:Ljava/lang/Integer;

    .line 6
    .line 7
    return-object p0
.end method

.method public b(Z)Ls1/b$c;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls1/b$c;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Ls1/b$c;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls1/b$c;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ls1/n0;)Ls1/b$c;
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/b$c;->g:Ls1/n0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Landroid/os/UserHandle;)Ls1/b$c;
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/b$c;->d:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/android/launcher3/util/N2;)Ls1/b$c;
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/b$c;->e:Lcom/android/launcher3/util/N2;

    .line 2
    .line 3
    return-object p0
.end method
