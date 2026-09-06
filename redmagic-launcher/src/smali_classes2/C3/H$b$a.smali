.class LC3/H$b$a;
.super Ljava/lang/Object;
.source "Streams.java"

# interfaces
.implements Ljava/lang/CharSequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LC3/H$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private g:[C

.field private h:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(LC3/H$a;)V
    .locals 0

    .line 2
    invoke-direct {p0}, LC3/H$b$a;-><init>()V

    return-void
.end method


# virtual methods
.method a([C)V
    .locals 0

    .line 1
    iput-object p1, p0, LC3/H$b$a;->g:[C

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, LC3/H$b$a;->h:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public charAt(I)C
    .locals 0

    .line 1
    iget-object p0, p0, LC3/H$b$a;->g:[C

    .line 2
    .line 3
    aget-char p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public length()I
    .locals 0

    .line 1
    iget-object p0, p0, LC3/H$b$a;->g:[C

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, LC3/H$b$a;->g:[C

    .line 4
    .line 5
    sub-int/2addr p2, p1

    .line 6
    invoke-direct {v0, p0, p1, p2}, Ljava/lang/String;-><init>([CII)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, LC3/H$b$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p0, LC3/H$b$a;->g:[C

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LC3/H$b$a;->h:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, LC3/H$b$a;->h:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method
