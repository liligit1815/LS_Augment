.class public LR1/n;
.super Ljava/lang/Object;
.source "StkNameManager.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a(Landroid/content/Context;)[Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Ljava/lang/String;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    aput-object v2, v0, v1

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    aput-object v2, v0, v3

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v4, "phone"

    .line 15
    .line 16
    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    :goto_0
    return-object v0

    .line 25
    :cond_1
    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->getSubId(I)[I

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    if-eqz v4, :cond_3

    .line 30
    .line 31
    array-length v5, v4

    .line 32
    if-nez v5, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    aget v4, v4, v1

    .line 36
    .line 37
    invoke-virtual {p0, v4}, Landroid/telephony/TelephonyManager;->getSimOperator(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    goto :goto_2

    .line 42
    :cond_3
    :goto_1
    move-object v4, v2

    .line 43
    :goto_2
    aput-object v4, v0, v1

    .line 44
    .line 45
    invoke-static {v3}, Landroid/telephony/SubscriptionManager;->getSubId(I)[I

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    if-eqz v4, :cond_5

    .line 50
    .line 51
    array-length v5, v4

    .line 52
    if-nez v5, :cond_4

    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_4
    aget v1, v4, v1

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/telephony/TelephonyManager;->getSimOperator(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    :cond_5
    :goto_3
    aput-object v2, v0, v3

    .line 62
    .line 63
    return-object v0
.end method
