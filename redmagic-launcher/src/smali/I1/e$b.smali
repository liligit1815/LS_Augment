.class public LI1/e$b;
.super Ljava/lang/Object;
.source "StringMatcherUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LI1/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final a:Ljava/text/Collator;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, LI1/e$b;->a:Ljava/text/Collator;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Ljava/text/Collator;->setStrength(I)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    invoke-virtual {v0, p0}, Ljava/text/Collator;->setDecomposition(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static a()LI1/e$b;
    .locals 1

    .line 1
    new-instance v0, LI1/e$b;

    .line 2
    .line 3
    invoke-direct {v0}, LI1/e$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method protected b(III)Z
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eqz p2, :cond_8

    .line 3
    .line 4
    packed-switch p2, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    const/16 v0, 0x9

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eq p1, p0, :cond_5

    .line 11
    .line 12
    const/4 p3, 0x2

    .line 13
    if-eq p1, p3, :cond_2

    .line 14
    .line 15
    const/4 p3, 0x3

    .line 16
    if-eq p1, p3, :cond_6

    .line 17
    .line 18
    const/16 p3, 0x14

    .line 19
    .line 20
    if-eq p1, p3, :cond_1

    .line 21
    .line 22
    packed-switch p1, :pswitch_data_1

    .line 23
    .line 24
    .line 25
    packed-switch p1, :pswitch_data_2

    .line 26
    .line 27
    .line 28
    return v1

    .line 29
    :pswitch_0
    if-eq p2, v0, :cond_0

    .line 30
    .line 31
    const/16 p1, 0xa

    .line 32
    .line 33
    if-eq p2, p1, :cond_0

    .line 34
    .line 35
    const/16 p1, 0xb

    .line 36
    .line 37
    if-eq p2, p1, :cond_0

    .line 38
    .line 39
    return p0

    .line 40
    :cond_0
    return v1

    .line 41
    :cond_1
    :pswitch_1
    return p0

    .line 42
    :cond_2
    const/4 p1, 0x5

    .line 43
    if-gt p2, p1, :cond_4

    .line 44
    .line 45
    if-gtz p2, :cond_3

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    return v1

    .line 49
    :cond_4
    :goto_0
    return p0

    .line 50
    :cond_5
    if-eq p3, p0, :cond_6

    .line 51
    .line 52
    const/16 p1, 0x1c

    .line 53
    .line 54
    if-eq p3, p1, :cond_6

    .line 55
    .line 56
    if-eq p3, v0, :cond_6

    .line 57
    .line 58
    if-eqz p3, :cond_6

    .line 59
    .line 60
    return p0

    .line 61
    :cond_6
    if-eq p2, p0, :cond_7

    .line 62
    .line 63
    return p0

    .line 64
    :cond_7
    return v1

    .line 65
    :cond_8
    :pswitch_2
    return p0

    .line 66
    nop

    .line 67
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :pswitch_data_1
    .packed-switch 0x9
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    :pswitch_data_2
    .packed-switch 0x18
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v1, p0, LI1/e$b;->a:Ljava/text/Collator;

    .line 8
    .line 9
    invoke-virtual {v1, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    return v2

    .line 17
    :cond_1
    if-gez v1, :cond_2

    .line 18
    .line 19
    iget-object p0, p0, LI1/e$b;->a:Ljava/text/Collator;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const p1, 0xffff

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-ltz p0, :cond_2

    .line 44
    .line 45
    return v2

    .line 46
    :cond_2
    :goto_0
    return v0
.end method
