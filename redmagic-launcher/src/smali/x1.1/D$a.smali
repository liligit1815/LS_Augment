.class public Lx1/D$a;
.super Ljava/lang/Object;
.source "HanziToPinyin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lx1/D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:I

.field public f:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lx1/D$a;->d:Z

    const/4 v0, 0x1

    .line 3
    iput v0, p0, Lx1/D$a;->e:I

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lx1/D$a;->f:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lx1/D$a;->d:Z

    const/4 v0, 0x1

    .line 7
    iput v0, p0, Lx1/D$a;->e:I

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lx1/D$a;->f:[Ljava/lang/String;

    .line 9
    iput p1, p0, Lx1/D$a;->a:I

    .line 10
    iput-object p2, p0, Lx1/D$a;->b:Ljava/lang/String;

    .line 11
    iput-object p3, p0, Lx1/D$a;->c:Ljava/lang/String;

    return-void
.end method
